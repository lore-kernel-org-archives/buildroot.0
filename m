From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 6 Aug 2008 10:54:17 +0200
Subject: [Buildroot] Makefile.autotools.in does not work
	wellwith	projects
In-Reply-To: <1218004314.29697.10.camel@localhost>
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
	<80DE307AE1CF4656A7072295EA2408F8@aeglos>
	<20080727013317.GA1706@cloud.net.au>
	<1217234557.7955.8.camel@localhost>
	<20080728085003.GA22274@cloud.net.au>
	<1217235161.7955.12.camel@localhost>
	<20080730101952.GB27907@mx.loc>
	<1218004314.29697.10.camel@localhost>
Message-ID: <20080806085417.GC7191@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 06, 2008 at 08:31:54AM +0200, Hans-Christian Egtvedt wrote:

>> Let me suggest to rename that variable to $(2)_TARGET_FILES
>> and do
>> $(2)_TARGET_INSTALL_TARGET = $(firstword $($(2)_TARGET_FILES))
>> 
>> foo_tmp=$(firstword $($(2)_TARGET_FILES))
>> or somthing like $(if $(foo_tmp),$(foo_tmp),$($(2).old_stamp_file))
>> 
>> Reasoning:
>> You really want to only have a few files in $(TARGET_DIR) as opposed to
>> $(STAGING_DIR). Those $(2)_TARGET_FILES should ideally be the only files
>> installed into the final image (think of a gazillion superfluous termcap
>> entries or other unneeded files).
>
>Then you need to overwrite the install rule anyway, my patch was
>intended to fix the general installation of applications.
>
>You seem to want a rule which will install only the binaries needed?

Yes. Ideally only the needed files should end on the target.
>
>Some applications and libraries are actually installed quite minimal and
>correct by using make DESTDIR install :)

true, but for those who don't, such target files should be used.
