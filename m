From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 04 Jan 2013 12:00:59 -0300
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50E6EDB5.9070004@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar> <50E6EDB5.9070004@petroprogram.com>
Message-ID: <50E6EEAB.4020001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/2013 11:56 AM, Stefan Fr?berg wrote:

> So should I continue patching correct buildroot prefixes to all those
> *-config files that
> are in $(STAGING_DIR)/usr/bin or not ?
> 
> From my $(STAGING_DIR)/usr/bin/*-config files only libpng and libxml2
> and few others
> do the right thing and give the buildroot prefix and not the host system
> prefix.
> (It took a long time for me to figure why wireshark that im trying to
> compile here did not
> work out with libpcap, untill I found out that the
> $(STAGING_DIR)/usr/bin/pcap-config spit a
> wrong prefix all the time...)

That's because libpng & libxml2 are doing what your patches do, fixing
up the *-config files.
What Samuel said (correct me if i'm wrong) is the developers meeting
kind of agreed on just dropping the *-config files in favour of
pkgconfig-based (*.pc) solutions, and patch wherever necessary.
What i say is let's fix the dreaded *-config files but in a generic way,
just declaring the relevant files to be fixed as the original mail i
replied to you said until we can properly move to a pkgconfig-only
solution, which i think won't be fast or easy.
Regards.
