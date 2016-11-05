From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Nov 2016 23:03:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-04
In-Reply-To: <20161105073056.4969320D86@mail.free-electrons.com>
References: <20161105073056.4969320D86@mail.free-electrons.com>
Message-ID: <df36574f-bff9-b295-2a82-825a13894f58@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Bernd,

Le 05/11/2016 ? 08:30, Thomas Petazzoni a ?crit :
> Hello,
> 
> Build statistics for 2016-11-04
> ================================
> 
>       successes : 179
>        failures : 51 
>        timeouts : 2  
>           TOTAL : 232
> 
> Classification of failures by reason
> ====================================
> 
> tvheadend-50a370707aedf5c12... | 3 
> 
> Detail of failures
> ===================
> 
>     mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/42a515acf4693cce344ecaad4b0077a44a17e6ce
>        nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/86f21884b08c4e8b4b77de4a6f72f1a5cea52400
>        nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/8098ebf879b659c4da5c8d2d2cbdac5dd3d272ec

This is a Local issue with LC_ALL=C host and mkbundle python script.

MKBUNDLE        bundle.c

Traceback (most recent call last):
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 172, in <module>
    idx = add_entry(ents)
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 151, in add_entry
    tmp = add_entry(ents[k], d, k, idx, p)
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 151, in add_entry
    tmp = add_entry(ents[k], d, k, idx, p)
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 151, in add_entry
    tmp = add_entry(ents[k], d, k, idx, p)
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 145, in add_entry
    output_file(d, k, idx+1, p)
  File
"/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/support/mkbundle",
line 72, in output_file
    depf.write('  %s\\\n' % p)
UnicodeEncodeError: 'ascii' codec can't encode characters in position 135-136:
ordinal not in range(128)
make[1]: ***
[/home/peko/autobuild/instance-1/output/build/tvheadend-50a370707aedf5c127e92bb517c378aa8ac04657/build.linux/bundle.c]
Error 1
make[1]: *** Waiting for unfinished jobs....

You can reproduce the issue easily by adding LC_ALL=C to TVHEADEND_BUILD_CMDS.
Can we force the utf8 encoding ?

Can you take a look ?

Thanks!

Best regards,
Romain
