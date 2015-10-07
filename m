From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Oct 2015 08:08:13 +0300
Subject: [Buildroot] Add [user@host dir] back to skeleton /etc/profile
In-Reply-To: <5614523A.2090204@cmlab.biz>
References: <5614523A.2090204@cmlab.biz>
Message-ID: <20151007050812.GA2375@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Tue, Oct 06, 2015 at 04:59:06PM -0600, David Van Arnem wrote:
> I noticed there was a commit pushed Saturday (f93c692c) which removed some
> bash-specific stuff from the skeleton shell profile in /etc/profile.  The
> default behavior for the shell prompt now is to only display "$" or "#",
> without the [user at host dir] prefix.  I just subscribed to the list today so
> I missed out on any discussion on this; was there a reason the [user at host
> dir] prefix was not left in the changes ("export PS1="[\u@\h \W]\\$ "")?  I
> have not encountered a Linux distribution that does not display this or a
> similar prompt, and I think it would be beneficial to add it back in.  I
> agree that the aliases, colors, etc should stay removed.

Buildroot generally provides by default only a minimum working configuration. 
The default shell (Busybox ash) does not display this command prompt prefix 
either, unless configured. Citing the good advice in commit f93c692c log 
message:

    If the user has a specific needs, it needs to be added in
    /etc/profile.d/ by a post-build script.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
