From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 07 Nov 2011 12:38:25 +0100
Subject: [Buildroot] coreutils: stty issue
In-Reply-To: <4EB7C088.9050407@visionsystems.de>
References: <4EB7C088.9050407@visionsystems.de>
Message-ID: <4EB7C331.4060305@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.11.2011 12:27, schrieb Yegor Yefremov:
> I need to setup speed of 3Mb/s for a FTDI based device. stty from busybox has a limit of about 1Mb/s. So I disabled stty from busybxo and compiled mainline coreutils. If I execute it I get following error:
> 
> # stty
> /bin/stty: line 1: ndgetaliasent_rfchdir__sigismemberether_ntoa_rbind_obstack_beginxdr_u_hyperregisterrpcclnt_perrnosgetspent_rposix_fadvise64wctombtimerfd_gettimeposix_spawn_file_actions_destroygetsgnam_rmremapstrcoll__towupper_linw__strtoul_internalsvcfd_createpthread_attr_getschedpolicyether_ntohostmodffiswalpha_IO_getc__wctomb_chkiconv_openrpc_createerr__libc_alloca_cutoff__strtok_rinet6_opt_set_valhtons_dl_addr__getcwd_chkgethostbyname_obstack_allocated_pmrand48__isoc99_wscanfdifftimehsearch__freelocalewcsncpy_IO_str_underflow__getgroups_chkmbsrtowcs__fread_unlocked_chkstrtoq__wcstol_lfchownatseed48_rfgetsgentswab__key_gendes_LOCALpthread_attr_setschedparamsprofil__longjmp_chk__write__connectstrftimemrand48_rtcsendbreakdirfdiconv__iswpunct_lwcpncpy__wcstombs_chk__strtoll_linet6_rth_segmentsrewinddir_
> 
> Any idea?

I recompiled coreutils and now stty is working as expected. Somehow the binary got corrupted. 

Yegor
