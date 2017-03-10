From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:30:03 +0100
Subject: [Buildroot] [PATCH 1/1] python: disable _ssl.c build when
 --disable-ssl
In-Reply-To: <CAO1odpzB59BT3cgh3AVznLzcWz+nShYsok1GqEv_SV9N3wXbLA@mail.gmail.com>
References: <1484169742-28866-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170310000437.5513602a@free-electrons.com>
 <CANQCQpa1Lp8hqpmaZREEoYbJEusrAerNQriQ_H4+ENped3DVAA@mail.gmail.com>
 <CAO1odpw8E=b2eTsVX8vCjhUF_vpg34WJvUxCKGCm+p0OSMsdkw@mail.gmail.com>
 <CAO1odpzng87mcYwEFs72B9bRTdLgewtGscH1GsuEAyndOVuntw@mail.gmail.com>
 <CAO1odpzB59BT3cgh3AVznLzcWz+nShYsok1GqEv_SV9N3wXbLA@mail.gmail.com>
Message-ID: <20170310213003.5cd63c7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 13:36:45 -0600, Adam Allison wrote:
> Ok, I guess my browser took a dump, and send the message early.
> 
> In setup.py, it will pull in hashlib if 'have_any_openssl' and
> 'have_usable_openssl' is true.
> 
> The old patch forced those to be false.
> This one (cleaner), but the setup.py will have to change as well.

Could you explain in more details what Buildroot configuration you're
using, the problem you're seeing, and what you're expecting to see
instead?

Notice that there is a different option for hashlib,
BR2_PACKAGE_PYTHON_HASHLIB, and it was very recently fixed to really
disable hashlib when disabled (commit
https://git.buildroot.org/buildroot/commit/?id=bc3e1fb22ef641916938fff76bef10a1347ef0f7).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
