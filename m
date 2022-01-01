Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C92FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0517600C6;
	Sat,  1 Jan 2022 14:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5LERrbXKtrU; Sat,  1 Jan 2022 14:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C483760596;
	Sat,  1 Jan 2022 14:13:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCCE51BF59D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE6A540133
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_yhGb6T8Mrg for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:13:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3CA640114
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:13:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c59:844e:fd99:5f73])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 29ACD20039F;
 Sat,  1 Jan 2022 15:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641046402;
 bh=bJH162yvSFfSMXnsZ7IlV6hax5ExqPSkqtrx1yCfSfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aOvv37MVICopICocXtUV8y1eqy+nJDZR33aTILntjy0psjCNBuWIp/A41kqcvM/l8
 EQPg8ZASBfe40rf8hfk5LkfRCzbD7coj6RcT84JzOo7+GP/Ok4gU6niagnq440prIL
 tTrIBoAZR+Hg0HjH5LxRrX0CU++8cMOmKr1A9co35uJC7VOy9TQs3lPO8BW4fLK0Mn
 hC++cTXokDtTXE6IHJdfyU5IBcLUOZYtJ4bcdX82kVC72WBgQZMC2xfOUKQCd+tlwU
 bWRflON+KzDxEVvFA2SbhXF6Fam0RLwRihHSEqqW4tgXEPJHbnm8ZbPK7H3Hvmk4dT
 hAXpjpt5J7I/g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 15:13:15 +0100
Date: Sat, 1 Jan 2022 15:13:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220101141315.GB2777@scaer>
References: <20211223090800.1716321-1-troglobit@gmail.com>
 <20211223090800.1716321-4-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223090800.1716321-4-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 3/3] package/makedevs: coding style and
 whitespace cleanup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2021-12-23 10:08 +0100, Joachim Wiberg spake thusly:
> This program is cobbled up with parts from all over the place, mostly
> BusyBox, so the style has not been kept consistent.  This patch is a
> modest attempt to clean it up a bit.  Some changes, e.g., comments are
> for consistency with the rest of the program.
> 
>  - The (new) top level .clang-format file has been used as an aid
>  - Overly long lines have been kept to keep the diff small and any
>    discussions on max line length in the project to a minimum
>  - Comment indentation has been kept, again to keep the diff small

While I appreciate the rasoning, I think that, if we have a code style
and a linter/reformatter, then we should just mechanically apply it and
not manually apply parts of the rules.

Otherwise, it does not help the maintenance/review anymore than the
current state.

So, I would be of the opinion that we should just blindly apply
clang-format and be done with that.

However, I'm also afraid that there might be different reformatting
rules based on the clang-format version... Maybe the version we use
should be documented somewhere?

Regards,
Yann E. MORIN.

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/makedevs/makedevs.c | 111 +++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 51 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index 2796cd5e78..ec7db8f3e8 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -44,7 +44,7 @@ uid_t recursive_uid;
>  gid_t recursive_gid;
>  unsigned int recursive_mode;
>  #define PASSWD_PATH "etc/passwd"  /* MUST be relative */
> -#define GROUP_PATH "etc/group"  /* MUST be relative */
> +#define GROUP_PATH  "etc/group"   /* MUST be relative */
>  
>  void bb_verror_msg(const char *s, va_list p)
>  {
> @@ -76,10 +76,12 @@ void bb_error_msg_and_die(const char *s, ...)
>  
>  void bb_vperror_msg(const char *s, va_list p)
>  {
> -	int err=errno;
> -	if(s == 0) s = "";
> +	int err = errno;
> +	if (s == 0)
> +		s = "";
>  	bb_verror_msg(s, p);
> -	if (*s) s = ": ";
> +	if (*s)
> +		s = ": ";
>  	fprintf(stderr, "%s%s\n", s, strerror(err));
>  }
>  
> @@ -129,8 +131,8 @@ int bb_make_directory (char *path, long mode, int flags)
>  	if (mode == -1) {
>  		umask(mask);
>  		mode = (S_IXUSR | S_IXGRP | S_IXOTH |
> -				S_IWUSR | S_IWGRP | S_IWOTH |
> -				S_IRUSR | S_IRGRP | S_IROTH) & ~mask;
> +			S_IWUSR | S_IWGRP | S_IWOTH |
> +			S_IRUSR | S_IRGRP | S_IROTH) & ~mask;
>  	} else {
>  		umask(mask & ~0300);
>  	}
> @@ -154,18 +156,22 @@ int bb_make_directory (char *path, long mode, int flags)
>  		}
>  
>  		if (mkdir(path, 0777) < 0) {
> -			/* If we failed for any other reason than the directory
> -			 * already exists, output a diagnostic and return -1.*/
> -			if ((errno != EEXIST && errno != EISDIR)
> -					|| !(flags & FILEUTILS_RECUR)
> -					|| (stat(path, &st) < 0 || !S_ISDIR(st.st_mode))) {
> +			/*
> +			 * If we failed for any other reason than the directory
> +			 * already exists, output a diagnostic and return -1.
> +			 */
> +			if ((errno != EEXIST && errno != EISDIR) ||
> +			    !(flags & FILEUTILS_RECUR) ||
> +			    (stat(path, &st) < 0 || !S_ISDIR(st.st_mode))) {
>  				fail_msg = "create";
>  				umask(mask);
>  				break;
>  			}
> -			/* Since the directory exists, don't attempt to change
> +			/*
> +			 * Since the directory exists, don't attempt to change
>  			 * permissions if it was the full target.  Note that
> -			 * this is not an error conditon. */
> +			 * this is not an error conditon.
> +			 */
>  			if (!c) {
>  				umask(mask);
>  				return 0;
> @@ -173,11 +179,13 @@ int bb_make_directory (char *path, long mode, int flags)
>  		}
>  
>  		if (!c) {
> -			/* Done.  If necessary, updated perms on the newly
> +			/*
> +			 * Done.  If necessary, updated perms on the newly
>  			 * created directory.  Failure to update here _is_
> -			 * an error.*/
> +			 * an error.
> +			 */
>  			umask(mask);
> -			if ((mode != -1) && (chmod(path, mode) < 0)){
> +			if ((mode != -1) && (chmod(path, mode) < 0)) {
>  				fail_msg = "set permissions of";
>  				break;
>  			}
> @@ -189,25 +197,29 @@ int bb_make_directory (char *path, long mode, int flags)
>  
>  	} while (1);
>  
> -	bb_perror_msg ("Cannot %s directory `%s'", fail_msg, path);
> +	bb_perror_msg("Cannot %s directory `%s'", fail_msg, path);
>  	return -1;
>  }
>  
> -const char * const bb_msg_memory_exhausted = "memory exhausted";
> +const char *const bb_msg_memory_exhausted = "memory exhausted";
>  
>  void *xmalloc(size_t size)
>  {
>  	void *ptr = malloc(size);
> +
>  	if (ptr == NULL && size != 0)
>  		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>  	return ptr;
>  }
>  
>  void *xcalloc(size_t nmemb, size_t size)
>  {
>  	void *ptr = calloc(nmemb, size);
> +
>  	if (ptr == NULL && nmemb != 0 && size != 0)
>  		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>  	return ptr;
>  }
>  
> @@ -216,6 +228,7 @@ void *xrealloc(void *ptr, size_t size)
>  	ptr = realloc(ptr, size);
>  	if (ptr == NULL && size != 0)
>  		bb_error_msg_and_die(bb_msg_memory_exhausted);
> +
>  	return ptr;
>  }
>  
> @@ -234,8 +247,9 @@ char *private_get_line_from_file(FILE *file, int c)
>  			linebuf = xrealloc(linebuf, linebufsz += GROWBY);
>  		}
>  		linebuf[idx++] = (char)ch;
> -		if (!ch) return linebuf;
> -		if (c<2 && ch == '\n') {
> +		if (!ch)
> +			return linebuf;
> +		if (c < 2 && ch == '\n') {
>  			if (c) {
>  				--idx;
>  			}
> @@ -263,7 +277,7 @@ long my_getpwnam(const char *name)
>  	FILE *stream;
>  
>  	stream = bb_xfopen(PASSWD_PATH, "r");
> -	while(1) {
> +	while (1) {
>  		errno = 0;
>  		myuser = fgetpwent(stream);
>  		if (myuser == NULL)
> @@ -284,7 +298,7 @@ long my_getgrnam(const char *name)
>  	FILE *stream;
>  
>  	stream = bb_xfopen(GROUP_PATH, "r");
> -	while(1) {
> +	while (1) {
>  		errno = 0;
>  		mygroup = fgetgrent(stream);
>  		if (mygroup == NULL)
> @@ -312,12 +326,12 @@ unsigned long get_ug_id(const char *s, long (*my_getxxnam)(const char *))
>  	return r;
>  }
>  
> -char * last_char_is(const char *s, int c)
> +char *last_char_is(const char *s, int c)
>  {
>  	char *sret = (char *)s;
>  	if (sret) {
>  		sret = strrchr(sret, c);
> -		if(sret != NULL && *(sret+1) != 0)
> +		if (sret != NULL && *(sret + 1) != 0)
>  			sret = NULL;
>  	}
>  	return sret;
> @@ -347,7 +361,7 @@ char *concat_path_file(const char *path, const char *filename)
>  	lc = last_char_is(path, '/');
>  	while (*filename == '/')
>  		filename++;
> -	bb_xasprintf(&outbuf, "%s%s%s", path, (lc==NULL ? "/" : ""), filename);
> +	bb_xasprintf(&outbuf, "%s%s%s", path, (lc == NULL ? "/" : ""), filename);
>  
>  	return outbuf;
>  }
> @@ -437,9 +451,8 @@ void bb_show_usage(void)
>  	exit(1);
>  }
>  
> -int bb_recursive(const char *fpath, const struct stat *sb,
> -		int tflag, struct FTW *ftwbuf){
> -
> +int bb_recursive(const char *fpath, const struct stat *sb, int tflag, struct FTW *ftwbuf)
> +{
>  	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
>  		bb_perror_msg("chown failed for %s", fpath);
>  		return -1;
> @@ -469,16 +482,16 @@ int main(int argc, char **argv)
>  	bb_applet_name = basename(argv[0]);
>  
>  	while ((opt = getopt(argc, argv, "d:")) != -1) {
> -		switch(opt) {
> -			case 'd':
> -				table = bb_xfopen((line=optarg), "r");
> -				break;
> -			default:
> -				bb_show_usage();
> +		switch (opt) {
> +		case 'd':
> +			table = bb_xfopen((line = optarg), "r");
> +			break;
> +		default:
> +			bb_show_usage();
>  		}
>  	}
>  
> -	if (optind >= argc || (rootdir=argv[optind])==NULL) {
> +	if (optind >= argc || (rootdir = argv[optind]) == NULL) {
>  		bb_error_msg_and_die("root directory not speficied");
>  	}
>  
> @@ -527,12 +540,11 @@ int main(int argc, char **argv)
>  			continue;
>  		}
>  
> -		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
> -						&type, &mode, user, group, &major,
> -						&minor, &start, &increment, &count)) ||
> -				((major | minor | start | count | increment) > 0xfffff))
> -		{
> -			if (*line=='\0' || *line=='#' || isspace(*line))
> +		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u",
> +				name, &type, &mode, user, group, &major, &minor,
> +				&start, &increment, &count)) ||
> +		    ((major | minor | start | count | increment) > 0xfffff)) {
> +			if (*line == '\0' || *line == '#' || isspace(*line))
>  				continue;
>  			bb_error_msg("line %d invalid: '%s'\n", linenum, line);
>  			ret = EXIT_FAILURE;
> @@ -567,7 +579,7 @@ int main(int argc, char **argv)
>  				ret = EXIT_FAILURE;
>  				goto loop;
>  			}
> -			if ((mode != -1) && (chmod(full_name, mode) < 0)){
> +			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
>  				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
>  				ret = EXIT_FAILURE;
>  				goto loop;
> @@ -587,7 +599,7 @@ int main(int argc, char **argv)
>  				ret = EXIT_FAILURE;
>  				goto loop;
>  			}
> -			if ((mode != -1) && (chmod(full_name, mode) < 0)){
> +			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
>  				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
>  				ret = EXIT_FAILURE;
>  				goto loop;
> @@ -601,19 +613,16 @@ int main(int argc, char **argv)
>  				ret = EXIT_FAILURE;
>  				goto loop;
>  			}
> -		} else
> -		{
> +		} else {
>  			dev_t rdev;
>  			unsigned i;
>  			char *full_name_inc;
>  
>  			if (type == 'p') {
>  				mode |= S_IFIFO;
> -			}
> -			else if (type == 'c') {
> +			} else if (type == 'c') {
>  				mode |= S_IFCHR;
> -			}
> -			else if (type == 'b') {
> +			} else if (type == 'b') {
>  				mode |= S_IFBLK;
>  			} else {
>  				bb_error_msg("line %d: Unsupported file type %c", linenum, type);
> @@ -621,7 +630,7 @@ int main(int argc, char **argv)
>  				goto loop;
>  			}
>  
> -			full_name_inc = xmalloc(strlen(full_name) + sizeof(int)*3 + 2);
> +			full_name_inc = xmalloc(strlen(full_name) + sizeof(int) * 3 + 2);
>  			if (count)
>  				count--;
>  			for (i = start; i <= start + count; i++) {
> @@ -640,7 +649,7 @@ int main(int argc, char **argv)
>  			}
>  			free(full_name_inc);
>  		}
> -loop:
> +	loop:
>  		free(line);
>  	}
>  	fclose(table);
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
