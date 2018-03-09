From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 08 Mar 2018 23:41:41 -0300
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
References: <20180308105619.54b75ca1@windsurf>
Message-ID: <5aa1f465d6aa1_36ed152233428337@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Mar 08, 2018 at 06:56 AM, Thomas Petazzoni wrote:

[snip]
>> It seems to not always return the same order. If I run the above script few
>> times in a row the order is consistent. If I wait few hours the result can
>> change.
> 
> Perhaps we should report this upstream to the people maintaining
> release-monitoring.org ?

I created:
https://github.com/release-monitoring/anitya/issues/533


Also, regarding the 'version' field, I found these lines of code:

class Project(Base):
...
        latest_version (sa.Boolean): The latest version for the project, as determined
            by the version sorting algorithm.
...
    def __json__(self, detailed=False):
...
            version=self.latest_version,

https://github.com/release-monitoring/anitya/blob/a0a9343dd86d9b7d41487b241f8e102d3321deee/anitya/db/models.py#L415
(PS: it's not a boolean of course, the comment is wrong in this aspect)


Regards,
Ricardo
