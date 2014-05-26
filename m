From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 14:10:25 +0200
Subject: [Buildroot] ssh connection: connection refused?
In-Reply-To: <CAMm5Yqqa4ajmfiRzgivA2pcnVaLhbaR=ni5fC_-N6YiH5Pbsww@mail.gmail.com>
References: <CAMm5Yqorxn=XyRZNGPpAx8xKtJDhtuAdhvuJLwR71ixzw0QUDQ@mail.gmail.com>
 <20140526135131.740b337d@free-electrons.com>
 <CAMm5Yqqa4ajmfiRzgivA2pcnVaLhbaR=ni5fC_-N6YiH5Pbsww@mail.gmail.com>
Message-ID: <20140526141025.0caae374@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear cem akpolat,

On Mon, 26 May 2014 14:04:33 +0200, cem akpolat wrote:

> I am using both, dropbear and openssh. If using together leads to the
> conflict, I should disable one of them.

Of course it leads to a conflict (though I believe one of them should
start successfully, and the other fail).

> By the way, I can boot first
> time the file system, I can login via ssh, but the second time I
> cannot and receive "connection refused". I have right now two init
> scripts under init.d. One for dropbear S50dropbear and the other for
> probably openssh S50sshd.

Please chose one or the other. Having two SSH servers listening on the
same TCP port doesn't make any sense.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
