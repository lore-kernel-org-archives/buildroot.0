From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 25 Jan 2017 20:13:02 +1300
Subject: [Buildroot] [PATCH 2/3] micropython-lib: depend on pcre
In-Reply-To: <20170125095450.2cb6aea4@free-electrons.com>
References: <20170124101423.11479-1-judge.packham@gmail.com>
 <20170124101423.11479-2-judge.packham@gmail.com>
 <20170125095450.2cb6aea4@free-electrons.com>
Message-ID: <CAFOYHZCU0__+T+B2+u26Fm5rrpP+QJqVPAkS27PEqbemHS7sDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2017 at 9:54 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 24 Jan 2017 23:14:22 +1300, Chris Packham wrote:
>> The micropython libs load libpcre dynamically using the foreign function
>> interface (libffi). Without pcre the build will succeed but at run time
>> anything that uses the 're' module will have issues.
>
> If it's only a runtime dependency, then why do you have
> "MICROPYTHON_LIBS_DEPENDENCIES = pcre" ? Selecting it in Config.in is
> sufficient to ensure that it will be built "at some point" during the
> build. In such cases, we normally do just:
>
>         select BR2_PACKAGE_PCRE # runtime
>
> and that's it.

Good point. I didn't look for any other examples of runtime
dependencies. As Peter has already applied this one I'll send another
to clarify that this is a runtime dependency and not a build time one.
