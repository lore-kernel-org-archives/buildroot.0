From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 21 Jun 2011 20:32:29 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper.c: Handle an
 arbitrary amount of arguments
In-Reply-To: <BANLkTim9Hm8zyVDSs5_cfu-fWh2Z=z3Xtw@mail.gmail.com>
References: <1308649845-21724-1-git-send-email-daniel.nystrom@timeterminal.se>
 <BANLkTim9Hm8zyVDSs5_cfu-fWh2Z=z3Xtw@mail.gmail.com>
Message-ID: <BANLkTikb3r=LzgqUemMwVYQ481M=YmfhWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/21 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> 2011/6/21 Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
>> @@ -55,21 +55,27 @@ static const char *get_basename(const char *name)
>> ?int main(int argc, char **argv)
>> ?{
>> ? ? ? ?int i;
>> + ? ? ? char **args, **cur;
>> +
>> + ? ? ? cur = args = malloc(sizeof(predef_args) + (sizeof(char *) * argc));
>
> Would you mind checking for args == NULL here, to avoid possible
> segfault on the next line (...and invalid free() later)? Thanks!

Would there be any other case but when running out of memory? Else,
you will have probably have bigger issues. :)

But indeed, handling it is to prefer. I'll fix it PATCHv2 which I will
post when there are no more comments on this one.
