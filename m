From: David Kessler <djkessler@utexas.edu>
Date: Wed, 18 Feb 2015 09:28:52 -0600
Subject: [Buildroot] How to avoid rebuilding host-cmake
In-Reply-To: <CAMQcK5+EMynEMspbf6N8VAbHeJksnZg4fP5NSqRDz2smdTK4yA@mail.gmail.com>
References: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
 <CAMQcK5+EMynEMspbf6N8VAbHeJksnZg4fP5NSqRDz2smdTK4yA@mail.gmail.com>
Message-ID: <54E4AFB4.1000705@utexas.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

Thanks for the reply. Before posting, I looked over the documentation 
that discusses when a full rebuild is required.  Your assumption is 
mostly correct, I have been doing some light kernel development. And I 
have been utilizing buildroot's <pkg>_OVERRIDE_SRCDIR option. However, I 
have also been experimenting with many different configuration options, 
options provided by buildroot and by the linux kernel.  According to the 
buildroot documentation, a full rebuild is required when removing a 
package, and I haven't had much success with adding packages without 
doing a full rebuild.

So, I ask about rebuilding host-cmake because it takes quite a long 
time, and it doesn't seem like it needs to be rebuilt when I'm merely 
adding or removing a package.  I suppose that is a bit of an assumption 
on my part.... maybe host-cmake does indeed need to be rebuilt, 
depending on the package I've added or removed?

In any case, thanks for your suggestions.

Best Regards,
David Kessler--


On 02/17/2015 05:02 PM, Ryan Barnett wrote:
> David,
>
> On Tue, Feb 17, 2015 at 4:38 PM, David Kessler <djkessler@utexas.edu> wrote:
>> I am trying to reduce the amount of time it takes to rebuild the
>> linux kernel and its dependencies.  I am already using the external
>> toolchain option (toolchain was originally built using buildroot, but
>> in an external directory) so I?m not rebuilding the toolchain
>> unnecessarily. However, for some reason after doing ?make clean?,
>> host-cmake has to be rebuilt. For my configuration host-cmake is
>> the most time consuming part of the build.
> A 'make clean' in the concept of Buildroot delete all build products
> (including build directories, host, staging and target trees, the
> images and the toolchain). Therefore, an understanding of when a full
> rebuild is necessary. Please see the following section in the manual:
>
> http://nightly.buildroot.org/manual.html#full-rebuild
>
> A per package rebuild functionality is availalbe and is described here:
>
> http://nightly.buildroot.org/manual.html#rebuild-pkg
>
> Is it fair to assume that you are trying to do kernel development?
>
> If so, then you should have a look at utilizing the
> <pkg>_OVERRIDE_SRCDIR functionality that Buildroot has which allows
> you to development of a package outside of Buildroot. For more
> detailed information on how to use this feature see Section 8.11.6 in
> the manual:
>
> http://nightly.buildroot.org/manual.html#_advanced_usage
>
> Lastly, you should take a look at utilizing ccache to speed up your
> builds, see Section 8.11.3 in the manual:
>
> http://nightly.buildroot.org/manual.html#_advanced_usage
>
> Thanks,
> -Ryan
>
