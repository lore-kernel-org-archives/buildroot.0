From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 18:27:36 +0100
Subject: [Buildroot] buildroot-reg
In-Reply-To: <CAOka8SzMY_oqW+wBT5PBUh1+nYhs_aooZaybMPFaNjpK+dDAbw@mail.gmail.com>
References: <CAOka8SzMY_oqW+wBT5PBUh1+nYhs_aooZaybMPFaNjpK+dDAbw@mail.gmail.com>
Message-ID: <20120306182736.5f41bcc9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For community support to Buildroot, I'd prefer if you asked the
Buildroot mailing list instead. Since your e-mail does not contain any
confidential information specific to your project, I took the freedom
of directly copying the Buildroot list for this reply. Please keep the
list in Cc for this discussion.

Le Tue, 6 Mar 2012 22:49:06 +0530,
saketha rama <ramasaketha@gmail.com> a ?crit :

>       I just found your PPT titled  "Using buildroot for real
> projects" .

Good. Just a detail: this document is not a PPT. PPT is a proprietary
file format that works only with the Microsoft Powerpoint proprietary
software, which I don't use. The document "Using Buildroot for real
projects" that you have found is a PDF generated with LaTeX.

> I have a great difficulty creating my customised rootfs
> for beaglebone embedded system using buildroot. It is said in your
> ppt that the buildroot/fs/skeleton will decide the rootfs structure,
> but after I change the skeleton also nothing is changed in my rootfs.

The skeleton is copied into the target directory (which will become the
contents of your root filesystem) at the *beginning* of the Buildroot
build process. Therefore, if you make changes to the skeleton, you must
do a "make clean; make" invocation to force Buildroot to restart the
build from scratch.

Of course, since this is practical at all, I do not recommend using the
skeleton mechanism to customize the root filesystem contents. I rather
recommend:

 *) Creating Buildroot packages if what you need to add to the root
 filesystem are additional libraries or applications ;

 *) Use the post-build script mechanism to add configuration files or
 scripts to the root filesystem. Since this post-build script is
 executed at the end of *every* build, it doesn't carry the same
 problem as the "customize skeleton" solution.

See slides 23 and 24 of the presentation "Using Buildroot for real
projects".

Do not hesitate to get back to us if you need more details about those
mechanisms,

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
