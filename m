From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Nov 2013 10:43:44 +0100
Subject: [Buildroot] [PATCH 1/1 v2] mongoose: startup script must use
	short options
In-Reply-To: <1385370203-7524-1-git-send-email-d.viti@infosolution.it> (Davide
 Viti's message of "Mon, 25 Nov 2013 10:03:23 +0100")
References: <1385370203-7524-1-git-send-email-d.viti@infosolution.it>
Message-ID: <87txf0lstr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Davide" == Davide Viti <zinosat@tiscali.it> writes:

 > From: Davide Viti <zinosat@tiscali.it>
 > mongoose fails to start because long options are not supported (as
 > shown by "mongoose -h")

That's not really true:

./mongoose -h
Mongoose version 3.7 (c) Sergey Lyubka, built Nov 25 2013
Usage:
  mongoose -A <htpasswd_file> <realm> <user> <passwd>
  mongoose <config_file>
  mongoose [-option value ...]

OPTIONS:
  -C cgi_pattern (default: "**.cgi$|**.pl$|**.php$")
  -E cgi_environment (default: "")
  -G put_delete_auth_file (default: "")
  -I cgi_interpreter (default: "")
  -P protect_uri (default: "")
  -R authentication_domain (default: "mydomain.com")
  -S ssi_pattern (default: "**.shtml$|**.shtm$")
  -T throttle (default: "")
  -a access_log_file (default: "")
  -d enable_directory_listing (default: "yes")
  -e error_log_file (default: "")
  -g global_auth_file (default: "")
  -i index_files (default: "index.html,index.htm,index.cgi,index.shtml,index.php")
  -k enable_keep_alive (default: "no")
  -l access_control_list (default: "")
  -m extra_mime_types (default: "")
  -p listening_ports (default: "8080")
  -r document_root (default: ".")
  -s ssl_certificate (default: "")
  -t num_threads (default: "20")
  -u run_as_user (default: "")
  -w url_rewrite_patterns (default: "")
  -x hide_files_patterns (default: "")
  -z request_timeout_ms (default: "30000")

Both forms are supported (E.G. -t or -num_threads), but for some reason
our init script used invalid arguments, that as far as I can see have
never been supported by mongoose.

I also prefer to use the (correct) long options, as that makes it more
clear what they do.

I've reworded the commit message to make this clear and committed,
thanks.

-- 
Bye, Peter Korsgaard
