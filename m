From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 17 Jul 2014 16:09:19 +0200
Subject: [Buildroot] [RFC 6/9] libgtk3: new package
In-Reply-To: <20140708173455.GB25364@rmm-p1267483>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
 <1404827832-1101-7-git-send-email-hadrien.boutteville@gmail.com>
 <20140708173455.GB25364@rmm-p1267483>
Message-ID: <53C7D90F.2040008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Jul 2014 19:34:57 +0200, Eric Le Bihan wrote:
>> +LIBGTK3_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
>> +		glib_cv_uscore=no \
>> +		ac_cv_func_strtod=yes \
>> +		ac_fsusage_space=yes \
>> +		fu_cv_sys_stat_statfs2_bsize=yes \
>> +		ac_cv_func_closedir_void=no \
>> +		ac_cv_func_getloadavg=no \
>> +		ac_cv_lib_util_getloadavg=no \
>> +		ac_cv_lib_getloadavg_getloadavg=no \
>> +		ac_cv_func_getgroups=yes \
>> +		ac_cv_func_getgroups_works=yes \
>> +		ac_cv_func_chown_works=yes \
>> +		ac_cv_have_decl_euidaccess=no \
>> +		ac_cv_func_euidaccess=no \
>> +		ac_cv_have_decl_strnlen=yes \
>> +		ac_cv_func_strnlen_working=yes \
>> +		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
>> +		ac_cv_func_lstat_empty_string_bug=no \
>> +		ac_cv_func_stat_empty_string_bug=no \
>> +		vb_cv_func_rename_trailing_slash_bug=no \
>> +		ac_cv_have_decl_nanosleep=yes \
>> +		jm_cv_func_nanosleep_works=yes \
>> +		gl_cv_func_working_utimes=yes \
>> +		ac_cv_func_utime_null=yes \
>> +		ac_cv_have_decl_strerror_r=yes \
>> +		ac_cv_func_strerror_r_char_p=no \
>> +		jm_cv_func_svid_putenv=yes \
>> +		ac_cv_func_getcwd_null=yes \
>> +		ac_cv_func_getdelim=yes \
>> +		ac_cv_func_mkstemp=yes \
>> +		utils_cv_func_mkstemp_limitations=no \
>> +		utils_cv_func_mkdir_trailing_slash_bug=no \
>> +		jm_cv_func_gettimeofday_clobber=no \
>> +		gl_cv_func_working_readdir=yes \
>> +		jm_ac_cv_func_link_follows_symlink=no \
>> +		utils_cv_localtime_cache=no \
>> +		ac_cv_struct_st_mtim_nsec=no \
>> +		gl_cv_func_tzset_clobber=no \
>> +		gl_cv_func_getcwd_null=yes \
>> +		gl_cv_func_getcwd_path_max=yes \
>> +		ac_cv_func_fnmatch_gnu=yes \
>> +		am_getline_needs_run_time_check=no \
>> +		am_cv_func_working_getline=yes \
>> +		gl_cv_func_mkdir_trailing_slash_bug=no \
>> +		gl_cv_func_mkstemp_limitations=no \
>> +		ac_cv_func_working_mktime=yes \
>> +		jm_cv_func_working_re_compile_pattern=yes \
>> +		ac_use_included_regex=no gl_cv_c_restrict=no \
>> +		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
>> +		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
>> +		ac_cv_prog_F77=no \
>> +		ac_cv_path_CUPS_CONFIG=no
> 
> I still wonder why all these definitions are needed... I manage to build
> libgtk3 using a uclibc-based toolchain without them (except for
> ac_cv_path_GTK_UPDATE_ICON_CACHE and ac_cv_path_GDK_PIXBUF_CSOURCE of course)!
> 
> Anyone with some background history on this?

I missed this comment in my previous mail. In fact I don't know if these
definitions (apart ac_cv_path_GTK_UPDATE_ICON_CACHE and
ac_cv_path_GDK_PIXBUF_CSOURCE) are still needed. I'm not an expert for
that, I have just reused them from libgtk2 mainly because I didn't test
with uclibc-based toolchain. I saw you removed them from your patch, and
I just successfully build with an uclibc-based toolchain too, so I think
we can remove the extra definitions.

Thanks!

Hadrien
