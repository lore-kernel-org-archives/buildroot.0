From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 09:27:23 +0100
Subject: [Buildroot] adding nodejs to buildroot
In-Reply-To: <2DD0B9C711CDFC45A3A266C78966CE7F4531F64B@G9W0750.americas.hpqcorp.net>
References: <2DD0B9C711CDFC45A3A266C78966CE7F4531F64B@G9W0750.americas.hpqcorp.net>
Message-ID: <20140219092723.112c19ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jenkins, Lee (ISS Houston),

On Wed, 19 Feb 2014 00:38:16 +0000, Jenkins, Lee (ISS Houston) wrote:

> I tried to add package nodejs to an old BuildRoot : 2011.05
> 
> Here's how I added the package:
> 1. I downloaded the nodejs package (Config.in, nodejs.mk, and nodejs...patch) from the latest buildroot into the buildroot/package/nodejs directory.
> 2. I added an entry for nodejs in buildroot/packages/Config.in under "Interpreter languages and scripting"
> 3. I ran "make menuconfig", selected the nodejs package (yes, it appeared in the right spot) and saved the configuration
> 
> But something is out of place because the make fails:
> 
> buildroot$ make nodejs
> make: *** No rule to make target `nodejs'. Stop.

You need to replace the last lines of nodejs.mk by:

$(eval $(call GENTARGETS,package,nodejs))
$(eval $(call GENTARGETS,package,nodejs,host))

However, there will most likely be a lot of other problems, as new
packages often rely on new features of the package infrastructure. So
you cannot simply take a package from a more recent version of
Buildroot, drop it in a 3 years older Buildroot and expect things to
work.

What about upgrading your Buildroot instead? By using such an old
version, you lose all the support that the community could give you,
because we are not really interested in solving issues occurring with a
3 years old Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
