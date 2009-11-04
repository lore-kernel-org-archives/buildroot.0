From: Emmanuel Riou <riou.emmanuel@googlemail.com>
Date: Wed, 04 Nov 2009 19:58:33 +0000
Subject: [Buildroot] RPATH issue
Message-ID: <4AF1DCE9.5080801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am trying to compile linphone (actually only linphonec, i.e. linphone 
in command line) and am experiencing an rpath linking issue.
The problem is that an RPATH header is added in both my binary and all 
the libraries installed in my project_build directory. The RPATH header 
is set to my lib staging directory which is obviously a problem when I 
execute my binary on the target.
the --disable-rpath configure option of linphone doesn't work, hence I 
tried to patch the configure script to set the relevant hardcode_* 
variables (i.e. hardcode_into_libs=no and hardcode_libdir_flag_spec="") 
but with no success. Would you have any advice to fix this?
I am using buildroot 2009.08.

Cheers,

-- 
Emmanuel Riou
