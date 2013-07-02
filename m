From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Jul 2013 19:31:11 +0200
Subject: [Buildroot] [PATCH] system: only set the root password if it's
 not empty
In-Reply-To: <20130702085224.GA25620@berrier.lan>
References: <20130702085224.GA25620@berrier.lan>
Message-ID: <20130702173111.GA3221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wade, All,

On 2013-07-02 02:52 -0600, Wade Berrier spake thusly:
> No need to replace the password in etc/shadow with a blank password.

How do you differentiate between those two cases:
  - use an empty password,
  - do not change the existing password?

My opinion is that we do want to be able to set an empty pasword,
especially in the case of a custom skeleton. This makes it systematic,
so the user knows what to expect.

If you want to not use the config option to handle the root password,
then you can use either:
  - a post-build script, or
  - a skeleton overlay.

(If I read the Makefiles correctly, skeleton overlays are handled during
target-finalize, which is called after target-root-passwd, so the
overlay should take precedence over the root password option. To be
confirmed...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
