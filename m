From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Mar 2020 04:37:10 +0000
Subject: [Buildroot] [Bug 12586] avahi failure
In-Reply-To: <bug-12586-163@https.bugs.busybox.net/>
References: <bug-12586-163@https.bugs.busybox.net/>
Message-ID: <bug-12586-163-u1N6CqAq5x@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12586

--- Comment #3 from Sam Petrocelli <sam.petrocelli@gmail.com> ---
Thanks for the reply. Yeah, I guess that's where the problem is. Unfortunately,
developers that came before have configured the system such that we have custom
python scripts that copy the files out of target and staging and we create a
file system outside of buildroot ourselves. (We also have a similar thing going
on for the kernel as well). I am in the process of getting everything undated
and standardized. What we want right now is a way that we can essentially copy
all of these files for the rootfs out. I see that if we make a tar fs, all the
passwd systemd, avahi, etc is all in there, but we want these files without
having to deal with untar. Do you have any suggestions for this? Thank you.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
