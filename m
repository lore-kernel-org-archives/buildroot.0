From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 29 Sep 2018 02:42:45 -0300
Subject: [Buildroot] [PATCH v2 2/2] support/scripts/pkg-stats: URL check
 using threads
References: <1537544157-2992-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5baf10d51c63b_62ce3fdd0e04334832349@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Sep 21, 2018 at 12:35 PM, Matt Weber wrote:

[snip]
> +def check_url_status_worker(url, url_status):
> +    if url_status != "Missing" and url_status != "No Config.in":
>          try:
> -            url_status_code = requests.head(pkg.url, timeout=5).status_code
> +            url_status_code = requests.head(url, timeout=5).status_code

In order to avoid false timeouts for slow hosts, or hosts with a high load, or
limited internet connection, or slow servers ... I think 30 seconds is a better
timeout here.

>              if url_status_code >= 400:
> -                pkg.url_status = "Invalid(%s)" % str(url_status_code)
> +                return "Invalid(%s)" % str(url_status_code)
>          except requests.exceptions.RequestException as e:

There is a warning from flake8 for this line. Please fix it in previous patch.


Regards,
Ricardo
