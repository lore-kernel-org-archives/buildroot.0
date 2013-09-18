From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 23:28:03 +0200
Subject: [Buildroot] [PATCH] qt5base: fix build when egl headers need a
 definition
In-Reply-To: <20130918185539.00adb05c@skate>
References: <1379503071-5446-1-git-send-email-fatih.asici@gmail.com>
 <20130918185539.00adb05c@skate>
Message-ID: <523A1AE3.9090802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 18:55, Thomas Petazzoni wrote:
> Dear Fatih A??c?,
>
> On Wed, 18 Sep 2013 14:17:51 +0300, Fatih A??c? wrote:
>> >The build with gpu-viv-bin-mx6q libraries was broken since it wasn't
>> >using "-DEGL_API_FB=1" flag which is found in egl.pc.
>> >
>> >Signed-off-by: Fatih A??c?<fatih.asici@gmail.com>
>> >---
>> >  package/qt5/qt5base/qt5base-egl-cflags.patch |   21 +++++++++++++++++++++
>> >  1 file changed, 21 insertions(+)
>> >  create mode 100644 package/qt5/qt5base/qt5base-egl-cflags.patch
>> >
>> >diff --git a/package/qt5/qt5base/qt5base-egl-cflags.patch b/package/qt5/qt5base/qt5base-egl-cflags.patch
>> >new file mode 100644
>> >index 0000000..7f9d779
>> >--- /dev/null
>> >+++ b/package/qt5/qt5base/qt5base-egl-cflags.patch
> All patches should have a description, and a Signed-off-by line. See
> http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.


  Also, please give your patch a number so that the order in which 
they're applied is predictable. At the moment this probably doesn't 
matter much, but it makes it easier later on to make sure a new patch 
will be applied after this one.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
