From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 03 Sep 2007 21:09:08 -0400
Subject: [Buildroot] Is there an issue with the xml2 installation
 packaged with BuildRoot?
In-Reply-To: <b6838d3a0709031755t6ea9e0eo2210fb6eb3881078@mail.gmail.com>
References: <b6838d3a0709031755t6ea9e0eo2210fb6eb3881078@mail.gmail.com>
Message-ID: <46DCB034.10507@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I am trying to link against libxml2 when I am building my other
> applications.  I continually get errors that I cannot link against
> libxml.  Could this be a result of how xml2 is installed.  If I look at
> $(STAGING_DIR)/usr/bin/xml2
> -conf, the paths are setup for the local environment ( i.e.
> /usr/lib/...).  and not relative to the $(STAGING_DIR) or
> $(TARGET_DIR).  The same goes for $(STAGING_DIR)/usr/lib/xml2Conf.sh
> 
> Output:
> checking for xmlParseFile... no
> configure: error: Unable to link with libxml
> 
> 
> Can anyone provide some clarification for me?

Which package are you trying to compile which is failing?
It's probably a problem with that package itself not referencing
the proper path for libxml2, so it tries to use your system's version.
I know PHP with libxml2 support compiles fine against buildroot's
libxml ... and it requires the -config script ...

-Brad
