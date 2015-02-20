From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Feb 2015 08:33:32 +0200
Subject: [Buildroot] How automate source download from a google drive?
In-Reply-To: <CAJpxd06ncFoxwLkeMyAuhPEXKNeH-Dh--Km=cvF0wN4e47xcVw@mail.gmail.com>
References: <54E54294.3030702@ou.edu>
 <CAJpxd06ncFoxwLkeMyAuhPEXKNeH-Dh--Km=cvF0wN4e47xcVw@mail.gmail.com>
Message-ID: <20150220063332.GQ2937@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bryce,

On Thu, Feb 19, 2015 at 02:12:58PM -0800, Bryce Schober wrote:
> On Wed, Feb 18, 2015 at 5:55 PM, Steve Kenton <skenton@ou.edu> wrote:
> > This is a bit off the wall. I'm working with a package called tovid
> > which you download from a google drive by clicking on a link on the wiki
> > Darn if I can figure out how to put that into the .mk file to automate it.
> > Look through packages directory and did not see anything obviously like it
> >
> > Any thoughts would be appreciated
> 
> This worked:
> wget --no-check-certificate '
> https://docs.google.com/uc?export=download&id=0B7aAfFRdwkUmeGZTT2pua0d1Z2c'
> -O ~/Downloads/tovid.tar.gz
> 
> Based on this SO answer:
> http://unix.stackexchange.com/a/148674/22389
> 
> You'll need to specify the full download name of the file because the wget
> redirect apparently doesn't get it.

wget --content-disposition works for me, almost. I get 
'tovid-0.35.tar.gztovid-0.35.tar.gz'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
