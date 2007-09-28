From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 27 Sep 2007 17:07:29 -0700 (PDT)
Subject: [Buildroot] lockfile-progs-0.1.10 not compile in Revision 20067
In-Reply-To: <a63ecaf0709271130p4c9548calbbf64e1c8004e813@mail.gmail.com>
References: <a63ecaf0709271130p4c9548calbbf64e1c8004e813@mail.gmail.com>
Message-ID: <12932524.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi ,

I also had the same problem and when i searched google i got a link to  "
http://osdir.com/ml/os.ecos.patches/2003-05/msg00042.html ". Following th
example i edited the file
/buildroot/build_arm/lockfile-progs-0.1.10/lockfile-progs.c at line 73 and
changed it to 

//  char *cmd_name = rindex(argv[0], '/');     <----- original
  char *cmd_name = strrchr(argv[0], '/');       <----- updated/corrected.

Now it works fine.

Regards
Gururaja


Sushi Sensei wrote:
> 
> make[1]: se ingresa al directorio
> `/tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10'
> /tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
> -Os -pipe  -I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/include
> -I/tmp/BUILDROOT/buildroot/build_i586/staging_dir/include
> --sysroot=/tmp/BUILDROOT/buildroot/build_i586/staging_dir/ -isysroot
> /tmp/BUILDROOT/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -o
> lockfile-create -L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/lib
> -L/tmp/BUILDROOT/buildroot/build_i586/staging_dir/usr/lib
> lockfile-progs.o-llockfile
> lockfile-progs.o: In function `parse_arguments':
> /tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10/lockfile-progs.c:73:
> undefined reference to `rindex'
> collect2: ld returned 1 exit status
> make[1]: *** [lockfile-create] Error 1
> make[1]: se sale del directorio
> `/tmp/BUILDROOT/buildroot/build_i586/lockfile-progs-0.1.10'
> make: ***
> [/tmp/BUILDROOT/buildroot/project_build_i586/uclibc/root/usr/bin/lockfile-create]
> Error 2
> 
> 
> -- 
> ------------------------------------------------------
> --- Timeo Danaos et dona ferentes ---
> ------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/lockfile-progs-0.1.10-not-compile-in-Revision-20067-tf4530200.html#a12932524
Sent from the BuildRoot mailing list archive at Nabble.com.
