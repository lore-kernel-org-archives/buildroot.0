From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 17:00:15 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTik3m_kFJjxqo-Y3XS0J+AjbhPfXQ3CiSXvVOs6n@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
	<20101214150520.253b9bae@surf>
	<AANLkTi=YP74FxwLhGyYo7gn5WFpR6PK8Qqw4UTWTE08N@mail.gmail.com>
	<20101214154228.51a969b6@surf>
	<AANLkTikOXep3YnuzHai4fzM-QEGb8BqSZvPsdRvQ_Hkc@mail.gmail.com>
	<20101214160558.325cddcb@surf>
	<AANLkTinQYpMH5VVCiXwLpN4io7rh=VaML+AX3yAOD5_F@mail.gmail.com>
	<20101214163754.6b1e664f@surf>
	<AANLkTik3m_kFJjxqo-Y3XS0J+AjbhPfXQ3CiSXvVOs6n@mail.gmail.com>
Message-ID: <20101214170015.23afdb41@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 17:56:06 +0200
Diego Iastrubni <diegoiast@gmail.com> wrote:

> And now it works. The problem is that shadow was not readable from the
> remote NFS.  Now I wait for the correct fix for this problem.

Ah, that's because your NFS directory is incorrectly exported. You
should use the no_root_squash option.

Otherwise, root accesses from the remote machine are made on the NFS
server as the nobody user, which obviously, can't access the
rootfs/etc/shadow file.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
