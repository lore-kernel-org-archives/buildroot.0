From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 19:33:30 +0200
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
 <alpine.LFD.2.11.1504160912290.18180@localhost>
 <20150416170525.GA4405@free.fr>
 <alpine.LFD.2.11.1504161307160.1401@localhost>
 <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
Message-ID: <20150416173330.GC4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-16 19:27 +0200, Thomas De Schampheleire spake thusly:
[--SNIP--]
> Using BR2_PRIMARY_SITE with scp to localhost is normally more easy than 
> setting up a web server, assuming an ssh server is already running.

Well, what about:

    $ python -m SimpleHTTPServer 8181

which will server the current directory via HTTP?

Do you want something even simpler? Hehe! ;-)

> That said, adding support for file:// in BR2_PRIMARY_SITE is trivial to add. In 
> fact, I used to have such a patch in a much older buildroot version.

Well, I was thinking of this, too, but I really wonder if that makes
sense: archives are copied from the primary, so you'd end up with
duplication locally.

Unless we're playing it smart and make symlinks.

But then what would happen if the archive disapear from primary?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
