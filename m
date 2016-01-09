From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 9 Jan 2016 10:13:58 -0300
Subject: [Buildroot] [PATCH 1/2] openssl: remove binary install option
In-Reply-To: <5690475B.2090201@mind.be>
References: <1451997340-4430-1-git-send-email-gustavo@zacarias.com.ar>
 <5690475B.2090201@mind.be>
Message-ID: <56910796.5040204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/16 20:33, Arnout Vandecappelle wrote:

> On 05-01-16 13:35, Gustavo Zacarias wrote:
>> In preparation for the libssl virtual and libressl inclusion, also
>> keeping with the KISS principle the binary can be removed in a
>> post-build script if need be, so remove the option and add it in legacy.
>
>   I did a build of openssl on aarch64, and the openssl binary makes up almost 20%
> of the package and 5% of a minimal filesystem (with glibc though). I think
> that's a fairly significant percentage, so I think it's worthwhile to keep this
> option.
>
>   Of course, people who care about size should probably use libressl :-)
>
>   How does it help for the libssl virtual package? For the engines I can
> understand because other packages select it, but this one could stay, no?
>
>   Regards,
>   Arnout

Hi Arnout.
It helps in having matching options for both. Regarding engines libressl 
doesn't handle that. And in openssl we just remove the tool with that 
option - arguably we can do the same with libressl, but then other 
people might chime in for adding that same option to some other $package 
and we'd get an option overload.
Hence i found the opportunity a good one for cleaning up.
Regards.
