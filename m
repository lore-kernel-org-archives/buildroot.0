From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2013 18:33:45 +0100
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <5105ABE8.70409@mind.be>
References: <510550FA.10502@relinux.de> <5105ABE8.70409@mind.be>
Message-ID: <510807F9.3040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/01/13 23:36, Arnout Vandecappelle wrote:
> On 27/01/13 17:08, Stephan Hoffmann wrote:
>> Hello all,
>>
>> buildroot provides direct calls to the configuration menus for busybox
>> and linux:
>>
>> make linux-menuconfig
>> make busybox-menuconfig
>>
>> Additionally, there is a linux-savedefconfig make target.
>>
>> All these save their output in the build directory, so that all changes
>> get lost when "make clean" is called. Thus I don't think that I am the
>> only one who has been surprised to notice that "make busybox-menuconfig
>> && make clean && make" does not have any effect on busybox's
>> configuration.
>
>   This is a bit a philosophical discussion: should the configuration
> files of linux, busybox, etc. be considered part of the buildroot
> configuration or not? In the former case, they should survive a 'make
> clean', in the latter case they should be removed by 'make clean'.
>
>   I tend to agree that the package configs should be considered part of
> the buildroot config. However, if your buildroot config specifies some
> BR2_PACKAGE_BUSYBOX_CONFIG, then I would expect that after 'make clean',
> that is the config that will be used. More generically, I expect I can do:
>
>   make foo_defconfig
>   Do all kinds of weird stuff that completely messes things up
>   make clean
>   make
>
> and to be back in the same state as 'make foo_defconfig; make'.
>
>
>   Bottom line: I tend to say no to this patch.


  After the feedback from Real Users (Stephan, Jeremy, Shawn), it looks 
like I have to revise my opinion...

  Or are there any other voices against?

  If this does go through, I would  like to have some way to throw away 
the customized config and revert to the configured config.  Perhaps a 
'realclean' target?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
