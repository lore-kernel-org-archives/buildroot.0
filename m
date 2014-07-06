From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 06 Jul 2014 16:59:51 +0200
Subject: [Buildroot] [PATCH] infra: fix autotools .la fixing when no .la
	files are present
In-Reply-To: <20140706144147.GB3684@free.fr>
References: <297a83abd0584662acb7.1404656584@localhost>
 <20140706144147.GB3684@free.fr>
Message-ID: <5603c98c-69ac-403d-bf91-48cf0cdee841@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Thomas, All,
>
>On 2014-07-06 16:23 +0200, Thomas De Schampheleire spake thusly:
>> Commit 6f638ea9c9c7bacc646430a74ad3dd2740eae676 ("infra: /usr support:
>> STAGING_DIR can be outside BASE_DIR") changed a for-construct around 'sed
>> -i' in a 'find | xargs sed -i'. However, if the find returns no results,
>> sed complains with:
>>     '/bin/sed: no input files'
>> 
>> Since a for construct is not very nice to handle this case, this commit
>> changes the 'find | xargs sed -i' into 'find -exec sed -i'.
>
>Why not use: 'xargs -r' instead?
>
>    --no-run-if-empty
>    -r     If the standard input does not contain any nonblanks, do
>           not run the command.  Normally, the command is run once
>           even if there is no input. This option is a GNU extension.
>
>Using 'find -exec' is OK, but it spawns a process for each result. I
>doubt we end up in a case with trillions of results, so the overhead
>should not be noticeable.

Aha, I didn't know this option. I did know about the overhead difference, but at least the -exec should be on par with the for loop.

I'll resubmit with this -r instead, thanks!

Best regards,
Thomas
