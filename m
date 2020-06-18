From: LP C <lpdev@cordier.org>
Date: Thu, 18 Jun 2020 18:26:33 +0200
Subject: [Buildroot] Status of parallel build with Qt5
In-Reply-To: <46ACAB16-73C3-4978-A7B4-ECCAC3E31D2A@getmailspring.com>
References: <46ACAB16-73C3-4978-A7B4-ECCAC3E31D2A@getmailspring.com>
Message-ID: <567F597D-0C15-4813-AF5E-8D11A9AEA380@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Jun 18 2020, at 3:51 pm, LP C <lp@cordier.org> wrote:

>  
>  
> On Jun 16 2020, at 4:46 pm, LP C <lpdev@cordier.org> wrote:
>  
>> On Jun 8 2020, at 11:32 pm, Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>>   
>>> On Mon, 8 Jun 2020 11:47:26 +0200
>>> LP C <lpdev@cordier.org> wrote:
>>>    
>>>> Is there any status regarding the build of Qt5 with parallel build?
>>>    
>>> See this series from Andreas:
>>>    
>>>  https://patchwork.ozlabs.org/project/buildroot/list/?series=159093
>>>    
>>>> Wouldn't be possible to disable parallel build for this specific
>>>> package in the meantime?
>>>    
>>> No, you can't disable parallel build for one specific package.
>>>    
>>>> PS: Newbie question here: what is the best practice to
>>>> answer/participate to an old thread from the mailing list? As I don't
>>>> have the email in my inbox, I cannot answer back, thus forcing me to
>>>> start a new thread. Thanks
>>>    
>>> I'm not sure if the mbox is easily available from the archives. If it
>>> was, you could import it in your e-mail client.
>>>    
>>> Thomas
>>> --    
>>> Thomas Petazzoni, CTO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>    
>>   
>> Hi,    
>>   
>> I tried to build with 2020.05 and also tried to compile with andreas
>> unmerged patches in top of it. I get this error, and I have no clues on
>> how to solve it. I'm building for the x86 target.
>>   
>> /sandbox/awow/per-package/qt5base/host/bin/x86_64-buildroot-linux-gnu-g++
>> --sysroot=/sandbox/awow/per-package/qt5multimedia/host/x86_64-buildroot-linux-gnu/sysroot
>> -Wl,--no-undefined -Wl,--version-script,QtMultimedia.version -Wl,-O1
>> -Wl,--enable-new-dtags -shared -Wl,-Bsymbolic-functions
>> -Wl,-soname,libQt5Multimedia.so.5 -o libQt5Multimedia.so.5.14.2
>> .obj/qmediabindableinterface.o .obj/qmediacontrol.o
>> .obj/qmediametadata.o .obj/qmediaobject.o .obj/qmediapluginloader.o
>> .obj/qmediaservice.o .obj/qmediaserviceprovider.o .obj/qmediatimerange.o
>> .obj/qmediaresourcepolicyplugin_p.o .obj/qmediaresourcepolicy_p.o
>> .obj/qmediaresourceset_p.o .obj/qmediastoragelocation.o
>> .obj/qmultimedia.o .obj/qmultimediautils.o .obj/qaudio.o
>> .obj/qaudioformat.o .obj/qaudiodeviceinfo.o .obj/qaudiooutput.o
>> .obj/qaudioinput.o .obj/qaudiosystemplugin.o .obj/qaudiosystem.o
>> .obj/qaudiodevicefactory.o .obj/qsoundeffect.o .obj/qwavedecoder_p.o
>> .obj/qsamplecache_p.o .obj/qsound.o .obj/qaudiobuffer.o
>> .obj/qaudioprobe.o .obj/qaudiodecoder.o .obj/qaudiohelpers.o
>> .obj/qsoundeffect_qaudio_p.o .obj/qcamera.o .obj/qcameraexposure.o
>> .obj/qcamerafocus.o .obj/qcameraimageprocessing.o
>> .obj/qcameraimagecapture.o .obj/qcamerainfo.o
>> .obj/qcameraviewfindersettings.o
>> .obj/qcameracapturebufferformatcontrol.o
>> .obj/qcameracapturedestinationcontrol.o .obj/qcameracontrol.o
>> .obj/qcamerainfocontrol.o .obj/qcameraexposurecontrol.o
>> .obj/qcamerafeedbackcontrol.o .obj/qcameraflashcontrol.o
>> .obj/qcamerafocuscontrol.o .obj/qcamerazoomcontrol.o
>> .obj/qcameraimagecapturecontrol.o .obj/qcameraimageprocessingcontrol.o
>> .obj/qcameralockscontrol.o .obj/qcameraviewfindersettingscontrol.o
>> .obj/qimageencodercontrol.o .obj/qmediacontainercontrol.o
>> .obj/qmediagaplessplaybackcontrol.o .obj/qmedianetworkaccesscontrol.o
>> .obj/qmediaplayercontrol.o .obj/qmediaplaylistcontrol.o
>> .obj/qmediaplaylistsourcecontrol.o .obj/qmediarecordercontrol.o
>> .obj/qmediastreamscontrol.o .obj/qmetadatareadercontrol.o
>> .obj/qmetadatawritercontrol.o .obj/qradiodatacontrol.o
>> .obj/qradiotunercontrol.o .obj/qvideorenderercontrol.o
>> .obj/qvideowindowcontrol.o .obj/qmediaaudioprobecontrol.o
>> .obj/qmediavideoprobecontrol.o .obj/qmediaavailabilitycontrol.o
>> .obj/qaudiodecodercontrol.o .obj/qvideoencodersettingscontrol.o
>> .obj/qaudioencodersettingscontrol.o .obj/qaudioinputselectorcontrol.o
>> .obj/qaudiooutputselectorcontrol.o .obj/qvideodeviceselectorcontrol.o
>> .obj/qaudiorolecontrol.o .obj/qcustomaudiorolecontrol.o
>> .obj/qmedianetworkplaylistprovider.o .obj/qmediacontent.o
>> .obj/qmediaplayer.o .obj/qmediaplaylist.o .obj/qmediaplaylistioplugin.o
>> .obj/qmediaplaylistnavigator.o .obj/qmediaplaylistprovider.o
>> .obj/qmediaresource.o .obj/qplaylistfileparser.o .obj/qradiodata.o
>> .obj/qradiotuner.o .obj/qaudiorecorder.o .obj/qmediaencodersettings.o
>> .obj/qmediarecorder.o .obj/qabstractvideobuffer.o
>> .obj/qabstractvideosurface.o .obj/qimagevideobuffer.o
>> .obj/qmemoryvideobuffer.o .obj/qvideoframe.o
>> .obj/qvideooutputorientationhandler.o .obj/qvideosurfaceformat.o
>> .obj/qvideosurfaceoutput.o .obj/qvideoprobe.o
>> .obj/qabstractvideofilter.o .obj/qvideoframeconversionhelper.o
>> .obj/qvideoframeconversionhelper_sse2.o .obj/moc_qaudioprobe.o
>> .obj/moc_qcamerafeedbackcontrol.o
>> .obj/moc_qmediagaplessplaybackcontrol.o .obj/moc_qvideoprobe.o
>> .obj/moc_qabstractvideofilter.o .obj/moc_qmediaresourcepolicyplugin_p.o
>> .obj/moc_qmediaresourceset_p.o .obj/moc_qplaylistfileparser_p.o
>> .obj/moc_qvideooutputorientationhandler_p.o
>> .obj/moc_qvideosurfaceoutput_p.o -latomic
>> /sandbox/awow/per-package/qt5multimedia/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Network.so
>> /sandbox/awow/per-package/qt5multimedia/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Gui.so
>> /sandbox/awow/per-package/qt5multimedia/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Core.so
>> -lpthread
>> -L/sandbox/awow/per-package/qt5base/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib
>> -lGL -lrt -lpthread -ldl?
>>   
>> /sandbox/awow/per-package/qt5base/host/bin/../lib/gcc/x86_64-buildroot-linux-gnu/8.4.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
>> cannot find /usr/lib64/libmvec_nonshared.a
>>   
>> collect2: error: ld returned 1 exit status
>> make[4]: *** [Makefile:529: ../../lib/libQt5Multimedia.so.5.14.2]
>> Error 1
>> make[3]: *** [Makefile:49: sub-multimedia-make_first] Error 2
>> make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>> make[1]: *** [package/pkg-generic.mk:266:
>> /sandbox/awow/build/qt5multimedia-5.14.2/.stamp_built] Error 2
>> make: *** [Makefile:23: _all] Error 2
>> make -j 8? 15205.79s user 2260.01s system 645% cpu 45:03.91 total
>>   
>>   
>> Defconfig:
>> =========================
>>   
>> BR2_x86_64=y
>> BR2_CCACHE=y
>> BR2_OPTIMIZE_3=y
>> BR2_REPRODUCIBLE=y
>> BR2_PER_PACKAGE_DIRECTORIES=y
>> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
>> BR2_TOOLCHAIN_BUILDROOT_CXX=y
>> BR2_GCC_ENABLE_OPENMP=y
>> BR2_TARGET_GENERIC_HOSTNAME="COMP"
>> BR2_TARGET_GENERIC_ISSUE="Welcome to COMP"
>> BR2_INIT_SYSTEMD=y
>> BR2_SYSTEM_BIN_SH_BASH=y
>> BR2_TARGET_GENERIC_GETTY_PORT="tty2"
>> BR2_LINUX_KERNEL=y
>> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.18"
>> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_MY_PATH)/board/COMP/linux-4.19.config"
>> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>> BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
>> BR2_PACKAGE_LINUX_TOOLS_CPUPOWER=y
>> BR2_PACKAGE_FFMPEG_GPL=y
>> BR2_PACKAGE_FFMPEG_NONFREE=y
>> BR2_PACKAGE_FFMPEG_POSTPROC=y
>> BR2_PACKAGE_MAKE=y
>> BR2_PACKAGE_SED=y
>> BR2_PACKAGE_TREE=y
>> BR2_PACKAGE_E2FSPROGS=y
>> BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
>> BR2_PACKAGE_EXFAT=y
>> BR2_PACKAGE_EXFAT_UTILS=y
>> BR2_PACKAGE_LIBVA_UTILS=y
>> BR2_PACKAGE_MESA3D=y
>> BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
>> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
>> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
>> BR2_PACKAGE_QT5=y
>> BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
>> BR2_PACKAGE_XORG7=y
>> BR2_PACKAGE_XSERVER_XORG_SERVER=y
>> BR2_PACKAGE_XAPP_SETXKBMAP=y
>> BR2_PACKAGE_XAPP_TWM=y
>> BR2_PACKAGE_XAPP_XINIT=y
>> BR2_PACKAGE_XAPP_XSET=y
>> BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
>> BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
>> BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
>> BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
>> BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
>> BR2_PACKAGE_XTERM=y
>> BR2_PACKAGE_FLUXBOX=y
>> BR2_PACKAGE_LINUX_FIRMWARE=y
>> BR2_PACKAGE_LINUX_FIRMWARE_I915=y
>> BR2_PACKAGE_LINUX_FIRMWARE_IBT=y
>> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
>> BR2_PACKAGE_ACPID=y
>> BR2_PACKAGE_ACPITOOL=y
>> BR2_PACKAGE_GPTFDISK=y
>> BR2_PACKAGE_GPTFDISK_GDISK=y
>> BR2_PACKAGE_GPTFDISK_SGDISK=y
>> BR2_PACKAGE_KBD=y
>> BR2_PACKAGE_LSHW=y
>> BR2_PACKAGE_LUA=y
>> BR2_PACKAGE_PYTHON=y
>> BR2_PACKAGE_PORTAUDIO=y
>> BR2_PACKAGE_LIBSHA1=y
>> BR2_PACKAGE_LIBCONFIG=y
>> BR2_PACKAGE_JASPER=y
>> BR2_PACKAGE_OPENCV_WITH_FFMPEG=y
>> BR2_PACKAGE_TIFF=y
>> BR2_PACKAGE_GNU_EFI=y
>> BR2_PACKAGE_X264=y
>> BR2_PACKAGE_ZEROMQ_DRAFTS=y
>> BR2_PACKAGE_NCURSES_WCHAR=y
>> BR2_PACKAGE_NCURSES_TARGET_PROGS=y
>> BR2_PACKAGE_HAVEGED=y
>> BR2_PACKAGE_DHCP=y
>> BR2_PACKAGE_DHCP_CLIENT=y
>> BR2_PACKAGE_IPTABLES=y
>> BR2_PACKAGE_NETWORK_MANAGER=y
>> BR2_PACKAGE_NETWORK_MANAGER_TUI=y
>> BR2_PACKAGE_PURE_FTPD=y
>> BR2_PACKAGE_WPA_SUPPLICANT=y
>> BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
>> BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=y
>> BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
>> BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>> BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
>> BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y
>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION=y
>> BR2_PACKAGE_FILE=y
>> BR2_PACKAGE_TIME=y
>> BR2_PACKAGE_WHICH=y
>> BR2_PACKAGE_EFIBOOTMGR=y
>> BR2_PACKAGE_HTOP=y
>> BR2_PACKAGE_SWUPDATE=y
>> # BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE is not set
>> BR2_PACKAGE_SYSTEMD_HIBERNATE=y
>> BR2_PACKAGE_SYSTEMD_LOGIND=y
>> BR2_PACKAGE_SYSTEMD_RFKILL=y
>> BR2_PACKAGE_TAR=y
>> BR2_PACKAGE_VIM=y
>> BR2_TARGET_ROOTFS_EXT2=y
>> BR2_TARGET_ROOTFS_EXT2_4=y
>> BR2_TARGET_ROOTFS_EXT2_LABEL="obrA"
>> BR2_TARGET_ROOTFS_EXT2_SIZE="850M"
>> # BR2_TARGET_ROOTFS_TAR is not set
>> BR2_TARGET_GRUB2=y
>> BR2_TARGET_GRUB2_X86_64_EFI=y
>> BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos
>> part_gpt normal efi_gop loadenv probe search search_fs_file
>> search_fs_uuid search_label cat echo regexp file"
>> BR2_TARGET_GRUB2_INSTALL_TOOLS=y
>> BR2_PACKAGE_HOST_CMAKE=y
>> BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> BR2_PACKAGE_HOST_GENEXT2FS=y
>> BR2_PACKAGE_HOST_GENIMAGE=y
>> BR2_PACKAGE_HOST_MTOOLS=y
>> BR2_PACKAGE_HOST_PKGCONF=y
>>   
>> Thanks for your help
>>   
>> Louis-Paul CORDIER
  
Hi again all,
  
It seems that qmake packages are failing to work when there is ld
scripts. For instance, this is the content of libm.so in my toolchain:
  
/* GNU ld script
*/
OUTPUT_FORMAT(elf64-x86-64)
GROUP ( /lib64/libm.so.6  AS_NEEDED ( /usr/lib64/libmvec_nonshared.a
/usr/lib64/libmvec.so.1 ) )

When I modify this path with absolute path to the package host dir (e.g:

/sandbox/awow/per-package/qt5multimedia/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libmvec_nonshared.a),
everything works fine. The build, however, fails with other package
afterwords (e.g zeromq).
  
I'm a bit lost about how qmake works when crosscompiling. As far as I
understand, it seems qmake -spec option is the way to go for
crosscompiling. But it also seems that depending on how qmake is
compiled, qmake already knows a lot about the target just by using the
configure options to build itself.
  
I'm feeling that something is missing on the qmake-package support
makefile. Note that I'm still Andreas 19/28 patch (Add per-package
support in qmake infra).
  
Any support on this would be great. Thanks!
  
Louis-Paul CORDIER
