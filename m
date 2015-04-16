From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 19:39:44 +0200
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <alpine.LFD.2.11.1504161331240.2952@localhost>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
 <alpine.LFD.2.11.1504160912290.18180@localhost>
 <20150416170525.GA4405@free.fr>
 <alpine.LFD.2.11.1504161307160.1401@localhost>
 <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
 <alpine.LFD.2.11.1504161331240.2952@localhost>
Message-ID: <20150416173943.GD4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2015-04-16 13:33 -0400, Robert P. J. Day spake thusly:
> On Thu, 16 Apr 2015, Thomas De Schampheleire wrote:
[--SNIP--]
> > Using BR2_PRIMARY_SITE with scp to localhost is normally more easy than
> > setting up a web server, assuming an ssh server is already running.
> >
> > That said, adding support for file:// in BR2_PRIMARY_SITE is trivial to add. In
> > fact, I used to have such a patch in a much older buildroot version.
> 
>   i think that would be useful as i'm in the situation of wanting to
> have a massive archive of S/W tarballs available for students in
> various embedded linux classes that they can take advantage of for
> their builds, but i (unsurprisingly) want that to be a read-only
> directory so they can't make a mess of it or arbitrarily add anything
> to it.

Well, how would those students reach that location? NFS?

Would it not make much more sense to share that location via HTTP and
use that as the primary, so you know they won;t be able to write
anything in there?

I think this is typically a case where the primary (over HTTP) is indeed
a good solution. And as I replied to Thomas, running a *simple* webserver
is pretty easy. Granted, there's no access control, no fancy stuff but
directory listing and file download (no fancy PUT, POST COL and stuff),
but that's basically just what you need in that case...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
