From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 16:36:05 -0500
Subject: [Buildroot] [PATCH v3 5/6] support/scripts/pkgstat: add target
 CPE reporting
In-Reply-To: <CAPP7BN2tKJ8c8DhyxzUOP3qj2Md7SqPuy_480R+wH+KMSqnhRg@mail.gmail.com>
References: <1525725005-41435-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1525725005-41435-6-git-send-email-matthew.weber@rockwellcollins.com>
 <CAPP7BN2tKJ8c8DhyxzUOP3qj2Md7SqPuy_480R+wH+KMSqnhRg@mail.gmail.com>
Message-ID: <CANQCQpZJatwj2FwRDxJJ=q6+nWgNQiNbG3xcHbBa6i6LT26jpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik,

On Wed, May 9, 2018 at 4:00 PM, Erik Larsson
<karl.erik.larsson@gmail.com> wrote:
> Hi!
>
> 2018-05-07 22:30 GMT+02:00 Matt Weber <matthew.weber@rockwellcollins.com>:
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  support/scripts/pkg-stats | 103 ++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 86 insertions(+), 17 deletions(-)
>>
[snip]
>> +def get_target_cpe_report(cpe_report_file, cpe_dict):
>> +    report_cpe_exact_match = ""
>> +    report_cpe_needing_update = ""
>> +    report_cpe_missing = ""
>> +
>> +    print "CPE: Checking for matches..."
>> +    with open(cpe_report_file) as cpe_file:
>
> "with open" will cause an exception if the file does not exist and
> Python will print an ugly Traceback before stopping.
> Maybe you can add a simple test if the file exists. The reason I found
> it was because I made a simple typo when testing it :)
>

Noted for next rev of this series.  Any other feedback on the behavior
of a target report?  (csv content, pkgstat output, etc?)


Matt
