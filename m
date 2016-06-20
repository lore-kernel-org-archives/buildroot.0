From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jun 2016 18:02:55 +0200
Subject: [Buildroot] [PATCH 010/121] package/gstreamer1: add hash file
In-Reply-To: <5767E69A.4030606@zacarias.com.ar>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
 <87y4612d65.fsf@dell.be.48ers.dk>
 <5767E69A.4030606@zacarias.com.ar>
Message-ID: <20160620160255.GA3502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-06-20 09:50 -0300, Gustavo Zacarias spake thusly:
> On 19/06/16 16:26, Peter Korsgaard wrote:
> 
> >>>>>>"Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >
> >  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >  > ---
> >  >  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
> >  >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  > diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
> >  > index b32fcfe..a3a33cb 100644
> >  > --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
> >  > +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
> >  > @@ -1,2 +1,2 @@
> >  > -# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
> >  > -sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
> >  > +# localy computed
> >  > +sha256  9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
> >
> >Just as for gstreamer, I've appended the sha256 to the file.
> 
> Hi.
> Why on earth do we need duplicate hashes (upstream + locally computed which
> are based on the same algo)?

Well, at least, it was the same hash! ;-)

> And what's the reason massive hashes are suddenly required? I've seen the
> autobuilders getting corrupted downloads, but why is it happening?

s Peter explained, that's because Github started acting silly a few days
ago... So we decided to take this opportunity to add as much hashes as
possible.

I did a script that would look for packages without hashes, and it
turned out that this script had a flaw: when a package was in a
sub-sub-directory like gstreamer and gstreamer1, the script would
mistakenly conclude that a hash was missing for that package, which was
wrong of course.

Fortunately, Peter noticed, but he was not careful enough (not that I
would blame him, drowned in the ~120 patches I sent!).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
