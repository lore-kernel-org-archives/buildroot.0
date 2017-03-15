From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Mar 2017 21:49:10 +0200
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <1489607040.19767.9.camel@linux.intel.com>
References: <1489417019.20145.214.camel@linux.intel.com>
 <1489420484.20145.218.camel@linux.intel.com>
 <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
 <1489590657.19767.1.camel@linux.intel.com>
 <372249453.14780914.1489593932103.JavaMail.zimbra@datacom.ind.br>
 <1489598613.19767.6.camel@linux.intel.com>
 <744747071.14828951.1489604108907.JavaMail.zimbra@datacom.ind.br>
 <1489607040.19767.9.camel@linux.intel.com>
Message-ID: <20170315194910.d5bftkd7vtozqfid@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,

On Wed, Mar 15, 2017 at 09:44:00PM +0200, Andy Shevchenko wrote:
> On Wed, 2017-03-15 at 15:55 -0300, Carlos Santos wrote:
> > Ouch! Does it build using host-openssl, instead?
> 
> At least I don't see any folder like that in output/.
> 
> $ ls -1d output/build/*ssl*
> ls: cannot access 'output/build/*ssl*': No such file or directory

What Carlos suggests is to build host-openssl manually

  make host-openssl

and then rerun the cmake build

  rm -r output/build/host-cmake*
  make host-cmake

Does that work?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
