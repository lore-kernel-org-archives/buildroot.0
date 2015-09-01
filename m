From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Tue, 1 Sep 2015 13:37:54 +0200
Subject: [Buildroot] [PATCH 1/6] python-urwid: bump version and add
 checksums
In-Reply-To: <20150901100816.GM17874@tarshish>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
 <20150901100816.GM17874@tarshish>
Message-ID: <20150901133754.4b9d975a@PAL-U515208D001>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thank you for your review!

On Tue, 1 Sep 2015 13:08:16 +0300, Baruch Siach wrote :
> On Tue, Sep 01, 2015 at 10:10:27AM +0200, Christophe Vu-Brugier wrote:
> > Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > ---
> >  package/python-urwid/python-urwid.hash | 3 +++
> >  package/python-urwid/python-urwid.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >  create mode 100644 package/python-urwid/python-urwid.hash
> > 
> > diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
> > new file mode 100644
> > index 0000000..2b18082
> > --- /dev/null
> > +++ b/package/python-urwid/python-urwid.hash
> > @@ -0,0 +1,3 @@
> > +# md from https://pypi.python.org/pypi?:action=show_md5&digest=a989acd54f4ff1a554add464803a9175, sha256 locally computed
> 
> This is weird. You put the MD5 in the URL to retrieve the same MD5? Is there a 
> way to lookup the MD5 using the package name? If not, I guess that 
> https://pypi.python.org/pypi/urwid/1.3.0 would be good enough.

I noticed that other packages downloaded from PyPI (e.g. python-tornado,
python-requests) have the same header in their hash file and decided to
do the same.

I am not aware of a way to lookup the checksum from the package name.
The only association I see between a package name and its checksum is
the URL to download a package from PyPI. For instance:

  https://pypi.python.org/packages/source/u/urwid/urwid-1.3.0.tar.gz#md5=a989acd54f4ff1a554add464803a9175

The "show_md5" action displays the MD5 if it is known. For instance :

  https://pypi.python.org/pypi?:action=show_md5&digest=a989acd54f4ff1a554add464803a9175
  displays a989acd54f4ff1a554add464803a9175

Whereas

  https://pypi.python.org/pypi?:action=show_md5&digest=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  displays 404 not found 

Anyway, I am OK with using https://pypi.python.org/pypi/urwid/1.3.0 or
https://pypi.python.org/packages/source/u/urwid/urwid-1.3.0.tar.gz#md5=a989acd54f4ff1a554add464803a9175
if you prefer.

What do other developers think? What is the best header for the hash
file of a PyPI package?

With best regards,

-- 
Christophe Vu-Brugier
