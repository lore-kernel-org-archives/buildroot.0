From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 31 Jan 2016 07:51:52 +0200 (IST)
Subject: [Buildroot] Error while Generating root filesystem image
 rootfs.ext2
In-Reply-To: <CABi8WTwGkpz3s3q=W5EGrYTPLunhSTDj8XcB_VXKMYLBE+x4Tw@mail.gmail.com>
References: <CABi8WTz9OL9BKNMCcd87k74q2QGh4XmetxjPu+pZCjo5nF03hw@mail.gmail.com>
 <alpine.DEB.2.11.1601302011320.27555@tanhuma.tkos.co.il>
 <CABi8WTwGkpz3s3q=W5EGrYTPLunhSTDj8XcB_VXKMYLBE+x4Tw@mail.gmail.com>
Message-ID: <alpine.DEB.2.11.1601310731560.6542@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2016, FrAnKenStEiN MC wrote:

> Date: Sat, 30 Jan 2016 21:42:28 +0000
> From: FrAnKenStEiN MC <chfakht@gmail.com>
> To: Jonathan Ben Avraham <yba@tkos.co.il>, buildroot at buildroot.org
> Subject: Re: [Buildroot] Error while Generating root filesystem image
>     rootfs.ext2
> 
> Yes you're right : /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games: /usr/local/games
> but why ? How can i remove the extra spaces ?

[snip]

Hi FrAnKenStEiN MC,
Here's how you can find where the extra white characters come from:

1. Open a new terminal window or console and do "echo $PATH". If you do 
not see the extra whitespace characters then they were probably added in 
the other shell by something that you did or some script that you ran in 
that shell after you opened it.

2. If you do see the whitespace characters when you do "echo $PATH" in a 
newly opened shell, then do "cat ~/.bashrc" and "cat ~/.bash_profile" to 
see if something in one of those files adds the whitespace. Not everyone 
uses .bash_profile, so you might not have it in your home directory. Be 
sure to check any files that might be sourced (either "source <some file>" 
or ". <some file>" in your .bashrc or .bash_profile files.

3. If you do not see the extra whitespace characters in  ~/.bashrc" 
~/.bashrc" or ~/.bash_profile then do "cat /etc/profile" to see if the 
PATH variable set there adds the extra characters.

4. If you do not see the extra whitespace characters in /etc/profile the 
check each of the files in /etc/profile.d.

When you check the files, be sure to cat the files in a terminal window 
that is more than 80 characters wide so that the line wrapping or 
chopping does not confuse your eye. It could be that someone edited 
/etc/profile using an editor that wraps lines and adds whitespace 
characters such as pico.

Good luck,

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
