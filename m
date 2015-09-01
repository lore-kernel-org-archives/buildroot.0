From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 1 Sep 2015 07:18:31 -0300
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.1p1
In-Reply-To: <CAGm1_ku7aBHOPyKGpvXFKzPPc-kgjYTd9MqZ1dB0yAR7r7aOrQ@mail.gmail.com>
References: <1440528839-20096-1-git-send-email-gustavo@zacarias.com.ar>
 <CAGm1_ku7aBHOPyKGpvXFKzPPc-kgjYTd9MqZ1dB0yAR7r7aOrQ@mail.gmail.com>
Message-ID: <55E57B77.6070602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/15 03:46, Yegor Yefremov wrote:

> Hi Gustavo,

Hi Yegor.

> Are you using special sshd_config? After updating to 7.1p1 I couldn't
> login with the default config. ssh said "Permission denied". After
> downgrading to 6.9p1 I could login as usual.

I bet you're trying to login as root, aren't you?
There's been a default behaviour change with 7.0p1+, password root 
logins are disable by default, root can only login via ssh keys.
We had a small chat with Yann and Peter on IRC and decided following 
upstream was best (opposed to try tweaking the sshd_config).
Regards.
