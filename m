From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 9 Apr 2015 22:20:54 +0200
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <55265956.3020607@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <XnsA4777FCDAF5A6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <55265956.3020607@zacarias.com.ar>
Message-ID: <20150409202054.GD27057@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> On 04/09/2015 07:33 AM, Bernd Kuhls wrote:
> 
> > Hi,
> > 
> > is this really necessary? Building samba4 with uclibc worked here and I guess 
> > the problem you saw with nss.h was fixed in 4.2.0rc3:
> > https://bugzilla.samba.org/show_bug.cgi?id=11026
> > 
> > Please note that I tested compilation only, for a runtime test I need more 
> > time.
> 
> Even if building with nss.h is fixed you still need $ORIGIN support
> which uClibc lacks in the current releases.
> So you'll have runtime issues.
> In the past (samba 4.1.x) i moved libraries to /usr/lib as a workaround,
> but for 4.2.x this didn't seem enough/there's a lot of new libraries to
> move.

uClibc-ng has $ORIGIN support. Can you test it with samba4?

best regards
 Waldemar
