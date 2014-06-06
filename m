From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 6 Jun 2014 07:20:17 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
Message-ID: <20140606052017.GK4197@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Dallas Clement wrote,

> Hi All - I have seen posts on this subject before.? It looks like things flamed
> out.
> 
> http://lists.gnu.org/archive/html/autoconf/2012-11/msg00022.html
> 
> I'm getting killed by autoconf.? My builds take 1.5 hours even with ccache
> turned on.? Most of the cores in my very impressive build machine are sitting
> on their !#@ while autoconf is running.? Most of my packages rely on autotools
> and it seems that most of the time spent is running configure scripts.
> 
> Can anyone offer some advice on how to speed things up with autoconf?? Or is it
> a lost cause?
> 
> Many thanks,

There was an interesting discussion about performance on the autoconf
mailinglist:
http://lists.gnu.org/archive/html/autoconf/2014-03/msg00030.html

OpenWrt uses CONFIG_SITE with some global architecture and libc
dependent files, see here:
https://dev.openwrt.org/browser/trunk/include/site

OpenEmbedded uses CONFIG_SITE, too:
http://cgit.openembedded.org/openembedded-core/tree/meta/site
They have a lot of package specific values added to their files.

May be the OpenWrt way with just a few global cached values would be
a benefit for buildroot performance? 

best regards
        Waldemar
