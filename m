From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 9 Jan 2016 10:09:34 -0300
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
In-Reply-To: <CA+sos78-UX4YD5WeO3qr4ahn+5iN33hX2pr2koiT9JtekdA8uA@mail.gmail.com>
References: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
 <568EB85E.3090501@zacarias.com.ar>
 <CA+sos7-4puPse5UehUFe3LO7DvfTattF+qUAu4n==LAdOBwYzw@mail.gmail.com>
 <568ECC28.50704@zacarias.com.ar> <569051BF.70209@mind.be>
 <CA+sos78-UX4YD5WeO3qr4ahn+5iN33hX2pr2koiT9JtekdA8uA@mail.gmail.com>
Message-ID: <5691068E.4090003@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/01/16 09:56, Beno?t Th?baudeau wrote:

> A few months ago, 4.1-ESV-R12 had an EoL date set to Dec. 2015 on
> https://www.isc.org/downloads/, but now it is TBA. It probably means
> that they did not have a chance to finalize the deprecation of 4.1 in
> Dec. 2015, and that they are rescheduling it, but that it will come
> soon. Also, several distributions like Ubuntu have already switched to
> 4.3.x, and this version seems to fix the ifupdown 0.8.2 issue
> according to what has been previously said in this thread. Regarding
> the build, Gustavo has said above that it is broken with a bind
> external to the dhcp package, but it should hopefully work fine with
> the built-in bind.
>
> All in all, we should probably bump the version to 4.3.3 rather than
> killing this package.
>
> Best regards,
> Beno?t

Hi all.
I agree, for a full-blown server there's not much alternative (there's 
dnsmasq for a small one, but it's not nearly as featured).
The bundled bind build is broken as well, since it doesn't pass any 
toolchain variables it tries to build with the distro gcc and so on, 
resulting in mixed architecture files.
The bundled version might be outdated with respect to bug/security fixes 
in bind as well, though it's not that likely since it uses just a small 
subset of functionality.
IMO the best solution would be to fix the makefiles/build and submit 
upstream, they were responsive the 1-2 times i submitted patches to fix 
things so it's probably the best bet.
Regards.
