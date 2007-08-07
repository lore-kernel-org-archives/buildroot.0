From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 07 Aug 2007 08:08:21 -0400
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <12028348.post@talk.nabble.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>
	<12028348.post@talk.nabble.com>
Message-ID: <46B860B5.8050205@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>      After i applied ur patch, i am getting an error when compilling libxml2
> as missing xml-config file
> 
> <snip>
> <snip>

> /home/guru/project/original/toolchains/buildroot/build_arm/staging_dir/usr/bin/xml2-config:
> No such file or directory
> make: ***
> [/home/guru/project/original/toolchains/buildroot/build_arm/libxml2-2.6.29/libxml2.la]
> Error 
> 
>    But i see that xml-config is in my buildroot/build_arm/libxml2-2.6.29
> directory. i think its not copied to build_arm/staging_dir/usr/bin/. kindly
> let me know if i can manually copy the same or i should add/make  any
> changes.

Well, the 'make install' inside the libxml2.mk is responsible for
copying over the xml2-config to your staging_dir's usr/bin directory.

Can you run:
make libxml2-clean
rm -rf build_arm/libxml2-2.6.29

then run 'make' and see if libxml2 builds and installs?  Perhaps it
didn't re-run the configuration step after the patch...

If that doesn't work, I'll go ahead and probably get rid of the
'make install', and just copy the files over directly (that's what
Gumstix's fork of buildroot does, and they may have had an actual
reason for it).  Odd I can't reproduce your situation though.

-Brad
