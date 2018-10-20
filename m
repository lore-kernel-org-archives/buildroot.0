From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 20 Oct 2018 15:56:09 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix finding redundant
 config mechanism
In-Reply-To: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
References: <1539989903-19803-1-git-send-email-Afshin.Nasser@gmail.com>
Message-ID: <CANQCQpaxMvn2OEfP0aztbFRk0KTOTnt8nugZ-gwKL7oML1eQUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nasser,

On Fri, Oct 19, 2018 at 11:58 PM Nasser <afshin.nasser@gmail.com> wrote:
>
> We use BR2_* style for configuration variables in buildroot so we should
> use this style when extracting configuration options. Otherwise CFG_LIST
> will almost always be empty.
>
> The CONFIG_* style has been taken form the Linux kernel and is not
> appropriate in this context.
>

The merge_config.sh is used for a couple scenarios
 - Appending kconfigs together (CONFIG_*)
 - Buildroot cfgs for runtime tests (BR2_*)
 - As a tool by users to merge together Buildroot configs

I'm not sure of the cleanest approach to support both
 - you could detect if the file is one or the other and adjust the regex
 - do the inverse and build a list of lines that are not comments

Matt
