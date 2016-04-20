From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 09:01:03 +0200
Subject: [Buildroot] [PATCH 2/4] linux-headers: indent custom choices
In-Reply-To: <5716B828.2070008@mind.be>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-3-git-send-email-vivien.didelot@savoirfairelinux.com>
 <5716B828.2070008@mind.be>
Message-ID: <20160420090103.6bb2c824@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 00:58:48 +0200, Arnout Vandecappelle wrote:

>   We currently have 5 choice statements where the contents is indented, and 54 
> where it's not. So I wouldn't say that we usually indent it...

I agreed.

>   That said, I'm not strictly against indenting choice contents: it's not going 
> to be nested any deeper, and the lines are normally not that long. The only 
> question is what to do with the help texts, because they would suddenly have to 
> be wrapped at 82 characters...

I prefer to keep things non-indented. Otherwise, to be consistent, we
would also have to indent the config options within a if...endif block,
or within a menuconfig...endmenu. And then suddenly you can have a
choice nested in an if, nested in a menuconfig, and your indentation
goes crazy.

So, I'd say no.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
