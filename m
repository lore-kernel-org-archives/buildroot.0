From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:47:33 +0200
Subject: [Buildroot] Buildroot licence for commercial product
In-Reply-To: <4C4DAE9A.4030402@terawatt.fr>
References: <4C4D5B7F.7020606@terawatt.fr> <20100726134259.2e2f5fc9@surf>
	<4C4DAE9A.4030402@terawatt.fr>
Message-ID: <20100729234733.2edde266@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Damien,

On Mon, 26 Jul 2010 17:49:46 +0200
Damien Borie <dbe@terawatt.fr> wrote:

> I have read this today, and I've made a list of all package in my 
> buildroot tree. I'm sure some of them are not installed, or not
> used,, because they where selected for some tests and never deleted...

Normally, "make external-deps" is supposed to tell you everything
Buildroot downloads to build the target system.

> So I got 9 package under ISC and 3 under BSD which only need to
> include the licence text. Then 3 under BSD which need an
> acknowledgement.

By acknowledgement, I assume you mean the 4-clause BSD license, which
says:

"
3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the <organization>.
"

I must confess I'm not sure in practice how one is supposed to respect
this requirement.

> Zlib and OpenSSL got special licences which need
> acknowledgements too.

The Zlib license does not seem to have an advertising clause like the
4-clause BSD license. The acknowledgement is only appreciated:

"
    1. The origin of this software must not be misrepresented; you must
not claim that you wrote the original software. If you use this software
in a product, an acknowledgment in the product documentation would
be appreciated but is not required.
"

In the OpenSSL license, you're correct, there is an acknowledgement
clause as well.

> 2 LGPL which need the licence text, and one of them (QT) needs to
> allow to modify QT version.

I am not sure what you mean here about QT.

Moreover, with the LGPL, you not only have to provide the licence text,
but also the complete source code of the LGPL component. See section 4
of http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html (if the LGPL
license version is indeed 2.1).

> And finally 13 GPL, 10 without Buildroot ncurses and fakeroot, which 
> need to give access to the source code.

Right, and the licence text.

> Ho, and mgetty for which I don't find the licence...
> And, I forget all X11 packages...Xserver Xorg is under BSD-like 
> licences, so I can just put the text. But I didn't look for all the
> sub packages and libraries...

Yeah, this is where "make external-deps" can help.

> I don't know how I will give access to all licences text, copyright,
> and source code, as the system is closed and nobody can connect to it
> except us...

I think a fairly sane and reasonable way is :

 * To create a webpage that lists all the free software components that
   you've used in your device, the version of these components, the
   modifications you made to these components (patches), the licence of
   these components. All with a link to the tarball of each component,
   hosted on your server and a link to the full license text.

 * To add to your product a simple paper that contains the list of the
   components, their license, and a link to the webpage mentionned
   before.

This way, you're transparent on what your device contains in terms of
free software, which license it is under, and you give the full source
code for all of them.

Of course, I am not a lawyer, so the suggestions above are not legal
advice.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
