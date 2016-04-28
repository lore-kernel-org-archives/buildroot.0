From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 23:40:25 +0200
Subject: [Buildroot] [genimage] Create a folder with a file using
	genimage
In-Reply-To: <CALtfCQYZn9FVyFPfjsL6YmGsPpkGwfsDeGWg_bdNezkKjm5=qg@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Wed, 27 Apr 2016 13:25:06 +0200")
References: <CALtfCQYZn9FVyFPfjsL6YmGsPpkGwfsDeGWg_bdNezkKjm5=qg@mail.gmail.com>
Message-ID: <87bn4tv2d2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I would like to use genimage to create an overlay folder in boot.vfat
 > partition to add (.dtbo or .dtb)  files. Does anyone know how to do this?

That is afaik not currently possible. We can either talk to the
pengutronix guys if they would be interested in adding such support
(E.G. either a "dir" type or allowing wildcards for the "file" type), or
you can generate the list of files outside genimage (E.G. in the
post-image script) and include that genimage snippet in the main file:

http://git.pengutronix.de/?p=genimage.git;a=blob;f=README#l16

-- 
Bye, Peter Korsgaard
