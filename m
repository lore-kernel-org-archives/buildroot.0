From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Mar 2014 07:51:03 +0200
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <CA+kK6WsRpy_8rvtVb6iSrBNYCB-QOsKCP18STAP6RNDj434yPg@mail.gmail.com>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
 <20140303233551.75c74c6a@skate>
 <CA+kK6WsRpy_8rvtVb6iSrBNYCB-QOsKCP18STAP6RNDj434yPg@mail.gmail.com>
Message-ID: <20140304055103.GX3874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcelo,

On Mon, Mar 03, 2014 at 11:39:59PM -0300, Marcelo Gutierrez wrote:
> I've applied this, but:
> >
> >  1/ The package lacks an init script to start the MySQL server
> >     automatically.
> >
> >  2/ When mysqld_safe is started automatically, it looks for stuff
> >     in /usr/var that doesn't exist:
> >
> > 700101 00:00:22 mysqld_safe Starting mysqld daemon with databases from
> > /usr/var
> > /usr/bin/mysqld_safe: line 595: can't create /usr/var/buildroot.err:
> > nonexistent directory
> > /usr/bin/mysqld_safe: eval: line 1: can't create /usr/var/buildroot.err:
> > nonexistent directory
> >
> 
> I can fix that but we'll need to add a mysql user and I have no idea how do
> it

You can to this by setting the MYSQL_USERS variable. See the example in 
section 7.2.4 of the manual 
(http://buildroot.net/downloads/manual/manual.html), and section 12.2 for 
syntax details.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
