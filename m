From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Nov 2018 22:53:53 +0100
Subject: [Buildroot] buildroot error: No hash found for gcc-7.3.0.tar.xz
In-Reply-To: <2776276a.afc0d.167306f454d.Coremail.lixuejun@vip.163.com>
References: <2776276a.afc0d.167306f454d.Coremail.lixuejun@vip.163.com>
Message-ID: <05e7b91c-7801-8985-8a83-38d53193aa84@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2018 10:24, ??? wrote:
> Dear Buildroot developers
> 
> ?
> 
> As a beginner, I?m looking?for?someadvices on the issue :?No hash found for
> gcc-7.3.0.tar.xz.
> 
> ?My platform is ubantu 18.04(64 bit) on VirtualBox(X86), buildroot 2018.08. The
> .config file is attached.
> 
> The following is a copy of the log from running buildroot make command:
> 
> ?
> 
> *ERROR: No hash found for gcc-7.3.0.tar.xz*
> 
> *package/pkg-generic.mk:135: recipe for target
> '/home/lxj/buildroot-2018.08.2/output/build/host-gcc-initial-7.3.0/.stamp_downloaded'
> failed*
> 
> *make: ***
> [/home/lxj/buildroot-2018.08.2/output/build/host-gcc-initial-7.3.0/.stamp_downloaded]
> Error 1*
> 
> *root at lxj-VirtualBox:/home/lxj/buildroot-2018.08.2#*
> 
> ?
> 
> There is a file ?gcc-7.3.0.tar.xz??at path /home/lxj/buildroot-2018.08.2/dl/gcc,
> and its sha256sum is:?
> *ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4
> ?gcc-7.3.0.tar.xz*
> 
> ?
> 
> There is a file ?gcc.hash??at path /home/lxj/buildroot-2018.08.2/package/gcc,

 There should be a symlink from package/gcc/gcc-initial/gcc-initial.hash to this
file. Is that symlink present, and is it pointing to the correct file?

 Regards,
 Arnout


> include the foloowing lines:
> 
> *# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-7.3.0/sha512.sum*
> 
> *sha512
> ?ad41a7e4584e40e92cdf860bc0288500fbaf5dfb7e8c3fcabe9eba809c87bcfa85b46c19c19921b0cdf6d05483faede8287bb9ea120c0d1559449a70e602c8d4
> ?gcc-7.3.0.tar.xz*
> 
> ?
> 
> Thank you?for?your consideration in advance.
> 
> ?Xuejun Li
> 
> 
> 
> 
> 
> --
> --------------------------------------------------------------------------------
> ??VIP????????????????????????????????????
> ????????????????????????????????????
> Alert message of Netease Vipmail?Never provide your password, security
> questions, verification codes, or any other personal important information
> details to anyone else.
> You can identify mail message by telephone,video-chat or other ways.You should
> make sure that your email address, bank account and other confidential
> information as secure as possible. Thank you for keeping your email account secure.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
