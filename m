From: Jordan Yelloz <jordan@yelloz.me>
Date: Mon, 13 Jun 2016 15:09:50 -0700
Subject: [Buildroot] [PATCH v3 1/1] fwup: blanked out MANS to avoid
 running help2man
In-Reply-To: <CA+-urNQTQdVJqimMzBEJG3i7-cAEbvPirPJJZ-+-WZ_fEZ52yQ@mail.gmail.com>
References: <20160613031101.27646-1-jordan@yelloz.me>
 <20160613052640.6977-1-jordan@yelloz.me>
 <CA+-urNQTQdVJqimMzBEJG3i7-cAEbvPirPJJZ-+-WZ_fEZ52yQ@mail.gmail.com>
Message-ID: <f85d6266-1fc1-8a0d-ade0-42955031e308@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/2016 02:51 PM, Frank Hunleth wrote:
> Hi Jordan,
> 
> How about the following for disabling 'help2man'?
> 
> # help2man doesn't work when cross compiling
> FWUP_CONF_ENV = ac_cv_path_HELP2MAN=''
> 
> This is similar to what's done for the torsmo package, and it seems a
> little more obvious in purpose.
> 

Good point, I will post a new patch with this change instead.

>> +FWUP_INSTALL_TARGET_OPTS = install-exec DESTDIR=$(TARGET_DIR)
> 
> The only other file that should be installed is the bash completions
> file. That's automatically removed from the target unless you have
> bash enabled.
> 

This was actually necessary with my inferior patch because help2man was
still needed to produce the man page which was part of the `install'
target but with your approach it's no longer needed.

--
Jordan
