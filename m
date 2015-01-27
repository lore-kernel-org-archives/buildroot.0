From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jan 2015 22:16:44 +0100
Subject: [Buildroot] [PATCH 2/8] package/libiio: update cmake code for
 libxml2 detection
In-Reply-To: <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
Message-ID: <54C8003C.3000507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/01/15 22:13, Samuel Martin wrote:
> Only check for libxml2 when it is needed.
> 
> This prevents CMake from falling back on the libxml2-config.cmake
> installed on the host system (i.e. when libxml2 >=2.9.2 is part of the
> host system), but not enabled as a target package (i.e. not existing in
> the staging tree).

 This is worrisome... I would hope that our cmake could be convinced never to
look in /usr/share/cmake when cross-compiling...


 Regards,
 Arnout

> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
