From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 8 Jan 2010 15:38:34 +0000 (UTC)
Subject: [Buildroot] Customize package makefile seems broken
References: <hi5jb1$cra$1@ger.gmane.org> <20100108085911.28fd62bb@surf>
Message-ID: <hi7jhq$v3k$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-01-08, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 7 Jan 2010 21:22:42 +0000 (UTC),
> Grant Edwards <grant.b.edwards@gmail.com> a ??crit :
>
>> I haven't figured out why two of the 6 files aren't getting
>> copied, but the mislocation appears to be due to a bug in
>> customize.mk:
>
> Because *.a files are removed from $(TARGET_DIR) as a final
> cleanup.
>
> See target-finalize: in the main Makefile:

Thanks, that's what I had decided after adding some debuging
"echos" to the customize makefile.  I hadn't tracked down
exactly where it was done (since it turns out I didn't actually
need the .a files in question).

The mtd utilities and u-boot env utilities are now building
cleaning and will run on the target.  [They don't actually
work, but I think that's a kernel problem with mtd support.]

-- 
Grant Edwards                   grante             Yow! My mind is a potato
                                  at               field ...
                               visi.com            
