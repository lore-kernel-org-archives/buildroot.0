From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 10 Feb 2014 11:25:50 +0100 (CET)
Subject: [Buildroot] How to set capabilities in rootfs images ?
In-Reply-To: <1364311655.5222144.1392024742879.JavaMail.root@openwide.fr>
Message-ID: <480464634.5225273.1392027950285.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to know if it's possible to set capabilities whith setcap for a specific binary
inside buildroot's rootfs image ?

I created a user account on target and I want to be able to run a program that needs CAP_SYS_NICE.

From what I have seen, it would be possible only in the fakeroot since the fakeroot's script
start with "chown -R 0:0".
chown drop all capabilities.

It appears that setcap tool is not working in fakeroot.

So, I updated fakeroot to the latest version (1.20) to have the last commit:
https://alioth.debian.org/scm/browser.php?group_id=30001

Also, I'm not sure if I need a specific version of host-tar (1.27.1) to save capabilities.

Do you have any suggestions ?

Thanks,
-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
