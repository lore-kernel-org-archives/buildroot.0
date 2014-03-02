From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Mar 2014 21:55:22 +0100
Subject: [Buildroot] [PATCH 0/13 v2] some download-related changes
In-Reply-To: <CAHXCMMJj3GskwyhNsXtZNcT_oRAVOZECQ6e9-8xCEG4uOE_g0A@mail.gmail.com>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
 <CAHXCMMJj3GskwyhNsXtZNcT_oRAVOZECQ6e9-8xCEG4uOE_g0A@mail.gmail.com>
Message-ID: <e621c002-e271-4fb7-ac3a-86ebfa4e460b@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel Martin <s.martin49@gmail.com> schreef:
>Yann, all
>
>On Sun, Mar 2, 2014 at 6:51 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> Hello All!
>>
>> This series contains those download-related changes:
>>
>>   - Patches 1..3  : some cleanups and preparatory works in the
>>     download infra,
>>
>>   - Patches 4..8  : move download helpers to shell scripts, one
>>     such script for each download helper
>>
>>   - Patches 9..10 : don't use DL_DIR as scratchpad for temporary VCS
>>     checkouts, since DL_DIR is a precious location
>>
>>   - Patches 11..13: check hashes of downloaded files, to ensure the
>>     files are genuine
>>
>>
>> Changes v1 -> v2:
>>   - don't do any behavioural change when switching to shell scripts,
>>     just reproduce exactly what was in the Makefile  (Luca, Arnout)
>>   - support more than one hash algorithm  (Arnout, Gustavo)
>>   - typoes  (Luca, Baruch)
>>
>>

In this same area (but can be in separate patches) we should protect all download helpers against interrupted downloads. This is already some for wget and git, but not for hg and the others...

Best regards,
Thomas
