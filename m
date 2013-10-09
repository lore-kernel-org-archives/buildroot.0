From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 8 Oct 2013 19:06:54 -0500
Subject: [Buildroot] using a local package file : why copy it to the
	dl	directory ?
In-Reply-To: <801961576E844FDBBB1A98A5E954A503@JohanW7>
References: <22B9374628844ED0809C78AC328E71C5@JohanW7>
 <20131009002331.5e89e31a@skate> <801961576E844FDBBB1A98A5E954A503@JohanW7>
Message-ID: <OFBBD2D686.76F54A62-ON86257BFE.0083B24D-86257BFF.0000A1F0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert,

Sagaert Johan <sagaert.johan@skynet.be> wrote on 
10/08/2013 06:12:20 PM:

> Dear Thomas
> 
> Maybe I did not explain it well, I did not mean to build out of the 
> tree, but the local package_xxx_tar.bz2 (in the case of tarred
> bz2)
> is already on our local system, so I tought there was no need to copy 
> the archive to the dl directory.

I believe you need to utilize the feature of specifying the DL directory
out-of-tree (outside of the buildroot source). Please see the manual:

http://buildroot.uclibc.org/downloads/manual/manual.html#_location_of_downloaded_packages

Finally when you specify the DL directory, copy or move the 
package_xx_tar.bz2
to the BR2_DL_DIR location. The reason the your tar file get copied to 
this location
is because buildroot's goal is to have every external file it depends on 
in one
location. This is an important feature because it makes it easy for us to 
have
all the packages in one location when we redistribute/release a system put 
together
using buildroot. 

> Johan 

Thanks,
-Ryan

------------------------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com
 
