From: Steve Kenton <skenton@ou.edu>
Date: Thu, 19 Feb 2015 10:03:24 -0600
Subject: [Buildroot] Fwd: Re:  grub2 failure with gcc-4.9
In-Reply-To: <54E60541.3030801@free.fr>
References: <54D39F5A.2010403@ou.edu> <54D3BA06.3050909@ou.edu>
 <54E60541.3030801@free.fr>
Message-ID: <54E6094C.40505@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/19/2015 09:46 AM, Thierry Bultel wrote:

>>>>  ... grub hangs.
>> I'm not sure if it's related but I think we are mixing host and
>> target grub2. When you run ~output/host/usr/sbin/grub-install
>> any scripts it runs such as grub-mkimage are run from the
>> build hosts /usr/... and not buildroot HOSTDIR or TARGETDIR
>> I have been getting elf header mismatches which I think are
>> differences between grub 2.00 and grub 2.01-beta
> 
> Thanks Steve,
> 
> FYI,
> I am not using grub-install, but instead:
> 
> sudo ./host/usr/sbin/grub-bios-setup \
> -b ./host/usr/lib/grub/i386-pc/boot.img \
> -c ./images/grub.img -d . /dev/sde
> 
> I have notified the grub mailing list, this seems to be an unknown issue and I need to fill a bug report. (and first try with 2.01-beta ...)
> 
> Thierry
> 
Yep, that's the correct way, I just wanted to mention that grub-install
is an easy trap to fall into if you let your fingers run on auto-pilot.
And it can produce subtle and hard to recognize problems which sounded
familiar :-)

Steve
