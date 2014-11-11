From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 10:12:56 -0300
Subject: [Buildroot] [PATCH 1/4] sysv init scripts: fix == bashism
In-Reply-To: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
References: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
Message-ID: <54620B58.9030304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2014 02:41 PM, Andr? Erdmann wrote:

> test a == b is not available in e.g. dash.
> 
> Command(s) used for editing:
> 
>   q=\[\"\'\]
>   operand="${q}?[$]?[a-zA-Z0-9_\?]+${q}?"  ## doesn't detect ${VAR}
>   test_expr="(\[\s+${operand}\s+)==(\s+${operand}\s+\])"
> 
>   find . -type f -name '[SK][0-9][0-9]*' | \
>      xargs sed -r -e "s@${test_expr}@\1=\2 at g" -i
> 
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
