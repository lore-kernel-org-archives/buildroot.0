From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 14:51:33 +0100
Subject: [Buildroot] [RFC 01/11] common service startup files
In-Reply-To: <20150322123914.GB21403@vostro>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <3116b4122f3e3ea776ce2739c11ee36ea967297f.1426960081.git.alex.suykov@gmail.com>
 <550E057E.2030605@mind.be> <20150322123914.GB21403@vostro>
Message-ID: <550EC8E5.9070101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 13:39, Alex Suykov wrote:
> The problem is that there are pretty long shell scripts that do not fit well
> within .ini files. Examples: sunxi-mali, ti-gfx, am33-cm3 and maybe some others.
> That's why I tried to keep .run files looking somewhat like shell scripts.

 Why would it not fit in an ini file? You just have to add some indentation:


startscript =
  echo 1 > /sys/devices/...
  bla bla bla
  and we're done



 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
