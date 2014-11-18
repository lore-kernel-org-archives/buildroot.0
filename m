From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 19:29:35 +0100
Subject: [Buildroot] tzdata.mk
In-Reply-To: <8737085.cg8s7E4bRe@z-md-01-lnx.aen.tetronik.com>
References: <8737085.cg8s7E4bRe@z-md-01-lnx.aen.tetronik.com>
Message-ID: <20141118182935.GF4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2014-11-04 08:10 +0100, Martin Dorwig spake thusly:
> i am using buildroot-2014.08 and
> maybe i found a bug inpackage/tzdata/ tzdata.mk
> 
> $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share
> cp -a $(HOST_DIR)/usr/share/zoneinfo $(TARGET_DIR)/usr/share/zoneinfo
> 
> if $(TARGET_DIR)/usr/share/zoneinfo already exist, cp will create 
> $(TARGET_DIR)/usr/share/zoneinfo/zoneinfo and copy the files there

Indeed.

> i suggest
> $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/zoneinfo
> cp -a $(HOST_DIR)/usr/share/zoneinfo/* $(TARGET_DIR)/usr/share/zoneinfo

That looks sensible, yes. I'll take care of doing the patch.

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
