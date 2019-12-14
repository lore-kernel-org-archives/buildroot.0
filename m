From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:55:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/dante: bump to version 1.4.2
In-Reply-To: <20191209222746.3440986-3-fontaine.fabrice@gmail.com>
References: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
 <20191209222746.3440986-3-fontaine.fabrice@gmail.com>
Message-ID: <20191214225557.7dbf4e51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon,  9 Dec 2019 23:27:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +As a result, $ERRVALFILE does not contain the expected values because
> +the expected value is not on the same line than gaierrval:
> +
> + gaierrval: 
> + # 130 "conftest.c" 3 4
> +           -3

I am not seeing this issue here, the relevant part of the .i file looks
like this:

# 129 "conftest.c" 2
int
main ()
{


gaierrval: -11



  ;
  return 0;
}

It's quite odd that you get this # 130 conftest.c line in the middle of
the .c file dump. What are we doing differently ? Is it a compiler
version issue ?

Which toolchain are you using when you're having the issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
